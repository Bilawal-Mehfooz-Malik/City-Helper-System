import * as admin from "firebase-admin";
import * as https from "firebase-functions/v2/https";
import { AdData, Priority } from "./types";
import { toISOString } from "./helpers";

export const getCarouselAdsLogic = async (
  firestore: admin.firestore.Firestore,
  data: any
): Promise<any[]> => {
  const categoryId = Number(data.categoryId);
  const subcategoryId =
    data.subcategoryId !== undefined ? Number(data.subcategoryId) : undefined;

  if (isNaN(categoryId)) throw new Error("categoryId must be a number.");

  const adsRef = firestore.collection("carousel_ads");
  const now = admin.firestore.Timestamp.now();

  let adsQuery: admin.firestore.Query = adsRef
    .where("categoryId", "==", categoryId)
    .where("isActive", "==", true)
    .where("status", "==", "approved")
    .where("startDate", "<=", now);

  if (subcategoryId !== undefined)
    adsQuery = adsQuery.where("subcategoryId", "==", subcategoryId);

  const snapshot = await adsQuery
    .orderBy("startDate", "desc")
    .orderBy("priorityScore", "desc")
    .orderBy("lastShownAt", "asc")
    .limit(30)
    .get();

  if (snapshot.empty) return [];

  const validAds = snapshot.docs
    .map((doc) => ({ id: doc.id, ...doc.data() } as AdData))
    .filter((ad) => ad.endDate.toMillis() >= now.toMillis());

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
    const selectedIds = new Set(selectedAds.map((ad) => ad.id));
    for (const ad of validAds) {
      if (selectedAds.length >= 5) break;
      if (!selectedIds.has(ad.id)) selectedAds.push(ad);
    }
  }

  return selectedAds.map((ad) => ({
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
) => {
  const adIds = data.adIds;
  if (!Array.isArray(adIds) || adIds.length === 0)
    throw new Error("adIds must be a non-empty array of strings.");

  const batch = firestore.batch();
  const nowTimestamp = admin.firestore.Timestamp.now();
  const adsCollection = firestore.collection("carousel_ads");
  let successfulImpressions = 0;

  for (const adId of adIds) {
    if (typeof adId !== "string" || !adId) continue;
    const adRef = adsCollection.doc(adId);
    const adDoc = await adRef.get();
    if (adDoc.exists) {
      batch.update(adRef, {
        impressionCount: admin.firestore.FieldValue.increment(1),
        lastShownAt: nowTimestamp,
      });
      successfulImpressions++;
    }
  }

  if (successfulImpressions > 0) await batch.commit();
  return { success: true, count: successfulImpressions };
};

export const recordAdClickLogic = async (
  firestore: admin.firestore.Firestore,
  request: any
) => {
  if (request.app == undefined) {
    throw new https.HttpsError(
      "failed-precondition",
      "The function must be called from an App Check verified app."
    );
  }
  const data = request.data;
  const adId = data.adId;
  if (typeof adId !== "string" || !adId)
    throw new Error("adId must be a non-empty string.");

  const adRef = firestore.collection("carousel_ads").doc(adId);
  const adDoc = await adRef.get();
  if (!adDoc.exists) throw new Error(`Ad with id ${adId} not found.`);

  await adRef.update({
    clickCount: admin.firestore.FieldValue.increment(1),
  });

  return { success: true };
};

export const deleteUserAccountLogic = async (
  firestore: admin.firestore.Firestore,
  request: any
) => {
  if (request.app == undefined) {
    throw new https.HttpsError(
      "failed-precondition",
      "The function must be called from an App Check verified app."
    );
  }
  if (!request.auth) {
    throw new Error("User must be authenticated to delete their account.");
  }

  const userId = request.auth.uid;
  const batch = firestore.batch();

  // 1. Delete user document
  const userRef = firestore.collection("users").doc(userId);
  batch.delete(userRef);

  // 2. Delete user reviews
  try {
    const reviewsSnapshot = await firestore
      .collection("reviews")
      .where("userId", "==", userId)
      .get();
    reviewsSnapshot.docs.forEach((doc) => batch.delete(doc.ref));
  } catch {
    throw new https.HttpsError("internal", "Failed to query user reviews.");
  }

  // 3. Delete food listings
  const foodListingsSnapshot = await firestore
    .collection("food_listings")
    .where("ownerId", "==", userId)
    .get();
  foodListingsSnapshot.docs.forEach((doc) => batch.delete(doc.ref));

  // 4. Delete residence listings
  const residenceListingsSnapshot = await firestore
    .collection("residence_listings")
    .where("ownerId", "==", userId)
    .get();
  residenceListingsSnapshot.docs.forEach((doc) => batch.delete(doc.ref));

  // 5. Commit batch
  await batch.commit();

  // 6. Delete user files
  const bucket = admin.storage().bucket();
  const profileImagePath = `users/${userId}/profile.jpg`;
  const shopImagesPath = `shops/${userId}/`;

  try {
    await bucket.file(profileImagePath).delete();
  } catch (error: any) {
    if (error.code !== 404) {
      throw new https.HttpsError(
        "internal",
        `Failed to delete profile image: ${error.message}`
      );
    }
  }

  try {
    await bucket.deleteFiles({ prefix: shopImagesPath });
  } catch (error: any) {
    if (error.code !== 404) {
      throw new https.HttpsError(
        "internal",
        `Failed to delete shop images: ${error.message}`
      );
    }
  }

  // 7. Delete from Authentication
  await admin.auth().deleteUser(userId);

  return { success: true, message: "User account deleted successfully." };
};
