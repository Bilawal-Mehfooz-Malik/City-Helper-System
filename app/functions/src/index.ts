import * as admin from "firebase-admin";
import * as https from "firebase-functions/v2/https";

import {
  onFoodListingCreated,
  onFoodListingDeleted,
  onResidenceListingCreated,
  onResidenceListingDeleted,
} from "./notification";

import {
  getCarouselAdsLogic,
  recordAdImpressionsLogic,
  recordAdClickLogic,
} from "./logic";

// Initialize Firebase Admin
if (!admin.apps.length) admin.initializeApp();
const firestore = admin.firestore();
firestore.settings({ ignoreUndefinedProperties: true });

// --- HTTPS Callable Functions ---
export const getCarouselAds = https.onCall(async (request) => {
  if (!request.app) throw new https.HttpsError("failed-precondition", "Must be called from App Check verified app.");
  try { return await getCarouselAdsLogic(firestore, request.data); } 
  catch (err: any) { throw new https.HttpsError("internal", err.message); }
});

export const recordAdImpressions = https.onCall(async (request) => {
  if (!request.app) throw new https.HttpsError("failed-precondition", "Must be called from App Check verified app.");
  try { return await recordAdImpressionsLogic(firestore, request.data); } 
  catch (err: any) { throw new https.HttpsError("internal", err.message); }
});

export const recordAdClick = https.onCall(async (request) => {
  if (!request.app) throw new https.HttpsError("failed-precondition", "Must be called from App Check verified app.");
  try { return await recordAdClickLogic(firestore, request.data); } 
  catch (err: any) { throw new https.HttpsError("internal", err.message); }
});

// --- Firestore v2 Triggers ---
export {
  onFoodListingCreated,
  onFoodListingDeleted,
  onResidenceListingCreated,
  onResidenceListingDeleted,
};
