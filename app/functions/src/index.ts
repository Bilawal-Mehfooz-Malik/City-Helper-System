import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

// Initialize Firebase Admin
if (admin.apps.length === 0) {
  admin.initializeApp();
}
const firestore = admin.firestore();
firestore.settings({ ignoreUndefinedProperties: true });

// --- TYPE DEFINITIONS ---
type Priority = 1 | 2 | 3;

interface AdData {
  id: string;
  businessId: string;
  categoryId: number;
  subcategoryId?: number;
  priorityScore: Priority;
  isActive: boolean;
  status: 'pending' | 'approved' | 'rejected' | 'paused';
  startDate: admin.firestore.Timestamp;
  endDate: admin.firestore.Timestamp;
  createdAt?: admin.firestore.Timestamp;
  updatedAt?: admin.firestore.Timestamp;
  lastShownAt?: admin.firestore.Timestamp | null;
  impressionCount?: number;
  clickCount?: number;
  imageUrl?: string;
  linkType?: 'internalProfile' | 'externalUrl';
  externalUrl?: string;
  internalProfileId?: string;
}

// --- HELPER FUNCTIONS ---
const toISOString = (timestamp?: admin.firestore.Timestamp | null): string | null => {
  return timestamp ? timestamp.toDate().toISOString() : null;
};

// --- CLOUD FUNCTIONS ---

// 1️⃣ Fetch carousel ads
export const getCarouselAds = functions.https.onCall(async (data, context) => {
  const categoryId = Number(data.data.categoryId);
  const subcategoryId = data.data.subcategoryId !== undefined ? Number(data.data.subcategoryId) : undefined;

  if (isNaN(categoryId)) {
    throw new functions.https.HttpsError('invalid-argument', 'categoryId must be a number.');
  }

  const adsRef = firestore.collection('carousel_ads');
  const now = admin.firestore.Timestamp.now();

  let adsQuery: admin.firestore.Query = adsRef
    .where('categoryId', '==', categoryId)
    .where('isActive', '==', true)
    .where('status', '==', 'approved')
    .where('startDate', '<=', now);

  if (subcategoryId !== undefined) {
    adsQuery = adsQuery.where('subcategoryId', '==', subcategoryId);
  }

  // Order by fields required for priority selection
  const snapshot = await adsQuery
    .orderBy('startDate', 'desc')
    .orderBy('priorityScore', 'desc')
    .orderBy('lastShownAt', 'asc') // Ensure lastShownAt exists
    .limit(60)
    .get();

  if (snapshot.empty) {
    console.log("No ads returned from Firestore query.");
    return [];
  }

  const validAds = snapshot.docs
    .map(doc => ({ id: doc.id, ...doc.data() } as AdData))
    .filter(ad => ad.endDate.toMillis() >= now.toMillis());

  console.log(`Total valid ads after endDate filter: ${validAds.length}`);

  const selectedAds: AdData[] = [];
  const quota: Record<Priority, number> = { 3: 2, 2: 2, 1: 1 };
  const priorityCounts: Record<Priority, number> = { 1: 0, 2: 0, 3: 0 };

  for (const ad of validAds) {
    if (selectedAds.length >= 5) break;
    const priority = ad.priorityScore;
    if (priorityCounts[priority] < quota[priority]) {
      selectedAds.push(ad);
      priorityCounts[priority]++;
    }
  }

  if (selectedAds.length < 5) {
    const selectedIds = new Set(selectedAds.map(ad => ad.id));
    for (const ad of validAds) {
      if (selectedAds.length >= 5) break;
      if (!selectedIds.has(ad.id)) selectedAds.push(ad);
    }
  }

  if (selectedAds.length > 0) {
    const batch = firestore.batch();
    const nowTimestamp = admin.firestore.Timestamp.now();
    for (const ad of selectedAds) {
      const adRef = adsRef.doc(ad.id);
      batch.update(adRef, {
        impressionCount: admin.firestore.FieldValue.increment(1),
        lastShownAt: nowTimestamp,
      });
    }
    await batch.commit();
  }

  return selectedAds.map(ad => ({
    ...ad,
    startDate: toISOString(ad.startDate),
    endDate: toISOString(ad.endDate),
    createdAt: toISOString(ad.createdAt),
    updatedAt: toISOString(ad.updatedAt),
    lastShownAt: toISOString(ad.lastShownAt),
  }));
});

// 2️⃣ Record ad impression
export const recordAdImpression = functions.https.onCall(async (data, context) => {
  const adId = data.data.adId;
  if (typeof adId !== 'string' || adId.length === 0) {
    throw new functions.https.HttpsError('invalid-argument', 'adId must be a non-empty string.');
  }
  const adRef = firestore.collection('carousel_ads').doc(adId);
  try {
    await adRef.update({
      impressionCount: admin.firestore.FieldValue.increment(1),
      lastShownAt: admin.firestore.Timestamp.now(),
    });
    return { success: true };
  } catch (error) {
    console.error(`Error recording impression for adId: ${adId}`, error);
    throw new functions.https.HttpsError('internal', 'Failed to record ad impression.');
  }
});

// 3️⃣ Record ad click
export const recordAdClick = functions.https.onCall(async (data, context) => {
  const adId = data.data.adId;
  if (typeof adId !== 'string' || adId.length === 0) {
    throw new functions.https.HttpsError('invalid-argument', 'adId must be a non-empty string.');
  }
  const adRef = firestore.collection('carousel_ads').doc(adId);
  try {
    await adRef.update({ clickCount: admin.firestore.FieldValue.increment(1) });
    return { success: true };
  } catch (error) {
    console.error(`Error recording click for adId: ${adId}`, error);
    throw new functions.https.HttpsError('internal', 'Failed to record ad click.');
  }
});

// 4️⃣ Seed carousel ads
export const seedCarouselAds = functions.https.onRequest(async (req, res) => {
  if (req.query.force !== 'true' && process.env.FUNCTIONS_EMULATOR !== 'true') {
    res.status(403).send('This can only be run in the emulator or with `?force=true`');
    return;
  }

  const batch = firestore.batch();
  const adsCollection = firestore.collection('carousel_ads');
  const now = new Date();

  for (let i = 0; i < 100; i++) {
    const docRef = adsCollection.doc(`ad_${i.toString().padStart(3, '0')}`);
    const categoryId = (i % 2) + 1;
    const priority = ((i % 3) + 1) as Priority;

    const ad: AdData = {
      id: docRef.id,
      businessId: `biz_${i}`,
      categoryId,
      subcategoryId: categoryId * 100 + (i % 5),
      priorityScore: priority,
      isActive: true,
      status: 'approved',
      startDate: admin.firestore.Timestamp.fromDate(new Date(now.getTime() - (i % 10) * 24 * 60 * 60 * 1000)),
      endDate: admin.firestore.Timestamp.fromDate(new Date(now.getTime() + (30 + (i % 30)) * 24 * 60 * 60 * 1000)),
      createdAt: admin.firestore.Timestamp.now(),
      updatedAt: admin.firestore.Timestamp.now(),
      lastShownAt: admin.firestore.Timestamp.fromDate(new Date(0)), // default to epoch
      impressionCount: Math.floor(Math.random() * 200),
      clickCount: Math.floor(Math.random() * 20),
      imageUrl: `https://picsum.photos/seed/${i}/1280/720`,
      linkType: i % 3 === 0 ? 'externalUrl' : 'internalProfile',
      externalUrl: i % 3 === 0 ? 'https://example.com' : undefined,
      internalProfileId: i % 3 !== 0 ? `entity_${categoryId}_${i}` : undefined,
    };

    batch.set(docRef, ad);
  }

  try {
    await batch.commit();
    res.status(200).send('Successfully seeded 100 carousel ads with default lastShownAt.');
  } catch (error) {
    console.error("Error seeding database:", error);
    res.status(500).send('Error seeding database.');
  }
});
