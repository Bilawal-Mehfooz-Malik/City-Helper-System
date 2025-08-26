import * as admin from "firebase-admin";
import { AdData, Priority } from "./types";

// --- HELPER FUNCTIONS ---
const toISOString = (timestamp?: admin.firestore.Timestamp | null): string | null => {
  return timestamp ? timestamp.toDate().toISOString() : null;
};

// --- LOGIC IMPLEMENTATIONS ---

export const getCarouselAdsLogic = async (
  firestore: admin.firestore.Firestore,
  data: any
): Promise<any[]> => {
  const categoryId = Number(data.categoryId);
  const subcategoryId = data.subcategoryId !== undefined ? Number(data.subcategoryId) : undefined;

  if (isNaN(categoryId)) {
    throw new Error('categoryId must be a number.');
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

  const snapshot = await adsQuery
    .orderBy('startDate', 'desc')
    .orderBy('priorityScore', 'desc')
    .orderBy('lastShownAt', 'asc')
    .limit(30)
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

  return selectedAds.map(ad => ({
    ...ad,
    startDate: toISOString(ad.startDate),
    endDate: toISOString(ad.endDate),
    createdAt: toISOString(ad.createdAt),
    updatedAt: toISOString(ad.updatedAt),
    lastShownAt: toISOString(ad.lastShownAt),
  }));
};

export const recordAdImpressionsLogic = async (
  firestore: admin.firestore.Firestore,
  data: any
): Promise<{ success: boolean; count: number }> => {
  const adIds = data.adIds;

  if (!Array.isArray(adIds) || adIds.length === 0) {
    throw new Error('adIds must be a non-empty array of strings.');
  }

  for (const adId of adIds) {
    if (typeof adId !== 'string' || adId.length === 0) {
      throw new Error('All items in adIds must be non-empty strings.');
    }
  }

  const batch = firestore.batch();
  const nowTimestamp = admin.firestore.Timestamp.now();
  const adsCollection = firestore.collection('carousel_ads');

  for (const adId of adIds) {
    const adRef = adsCollection.doc(adId);
    batch.update(adRef, {
      impressionCount: admin.firestore.FieldValue.increment(1),
      lastShownAt: nowTimestamp,
    });
  }

  await batch.commit();
  console.log(`Successfully recorded impressions for ${adIds.length} ads.`);
  return { success: true, count: adIds.length };
};

export const recordAdClickLogic = async (
  firestore: admin.firestore.Firestore,
  data: any
): Promise<{ success: boolean }> => {
  const adId = data.adId;
  if (typeof adId !== 'string' || adId.length === 0) {
    throw new Error('adId must be a non-empty string.');
  }

  const adRef = firestore.collection('carousel_ads').doc(adId);
  await adRef.update({ clickCount: admin.firestore.FieldValue.increment(1) });
  return { success: true };
};
