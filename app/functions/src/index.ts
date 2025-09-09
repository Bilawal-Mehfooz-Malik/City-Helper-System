import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import {
  getCarouselAdsLogic,
  recordAdImpressionsLogic,
  recordAdClickLogic
} from "./logic";

// Initialize Firebase Admin
if (admin.apps.length === 0) {
  admin.initializeApp();
}
const firestore = admin.firestore();
firestore.settings({ ignoreUndefinedProperties: true });

// --- CLOUD FUNCTIONS ---

// 1️⃣ Fetch carousel ads
export const getCarouselAds = functions.https.onCall(async (request) => {
  // Enforce App Check
  if (request.app == undefined) {
    throw new functions.https.HttpsError(
      'failed-precondition',
      'The function must be called from an App Check verified app.'
    );
  }
  try {
    return await getCarouselAdsLogic(firestore, request.data);
  } catch (error: any) {
    console.error('Error fetching carousel ads:', error);
    throw new functions.https.HttpsError('internal', error.message);
  }
});

// 2️⃣ Record ad impressions in batch
export const recordAdImpressions = functions.https.onCall(async (request) => {
  // Enforce App Check
  if (request.app == undefined) {
    throw new functions.https.HttpsError(
      'failed-precondition',
      'The function must be called from an App Check verified app.'
    );
  }
  try {
    return await recordAdImpressionsLogic(firestore, request.data);
  } catch (error: any) {
    console.error('Error recording batch impressions:', error);
    throw new functions.https.HttpsError('internal', error.message);
  }
});

// 3️⃣ Record ad click
export const recordAdClick = functions.https.onCall(async (request) => {
  // Enforce App Check
  if (request.app == undefined) {
    throw new functions.https.HttpsError(
      'failed-precondition',
      'The function must be called from an App Check verified app.'
    );
  }
  try {
    return await recordAdClickLogic(firestore, request.data);
  } catch (error: any) {
    console.error(`Error recording click for adId: ${request.data.adId}`, error);
    throw new functions.https.HttpsError('internal', error.message);
  }
});