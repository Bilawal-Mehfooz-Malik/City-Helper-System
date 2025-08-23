import { initializeApp } from "firebase-admin/app";
import { getFirestore } from "firebase-admin/firestore";
import { CloudTasksClient } from "@google-cloud/tasks";
import { onDocumentWritten } from "firebase-functions/v2/firestore";
import { onRequest } from "firebase-functions/v2/https";
import { updateAndReschedule } from "./core";
import { Place } from "./types";
import * as logger from "firebase-functions/logger"; // Import logger

// INITIALIZATION
initializeApp();
const tasksClient = new CloudTasksClient();
const firestore = getFirestore();

// CLOUD FUNCTION TRIGGERS
const collections = ["food_listings"];
for (const collection of collections) {
  exports[`onWrite_${collection}`] = onDocumentWritten(`${collection}/{placeId}`, async (event) => {
    const beforeData = event.data?.before.data() as Place | undefined;
    const afterData = event.data?.after.data() as Place | undefined;

    // Only proceed if relevant fields have changed or if it's a new document
    const relevantFieldsChanged =
      !beforeData || // New document
      JSON.stringify(beforeData.openingHours) !== JSON.stringify(afterData?.openingHours) ||
      beforeData.entityStatus !== afterData?.entityStatus;

    if (!relevantFieldsChanged) {
      logger.info(`No relevant changes for ${event.params.placeId}. Skipping update.`);
      return; // Exit early if no relevant changes
    }

    await updateAndReschedule(firestore, tasksClient, collection, event.params.placeId, afterData);
  });
}

export const setOpenStatus = onRequest({ timeoutSeconds: 300 }, async (request, response) => {
  try {
    const { collectionPath, placeId } = request.body;
    if (!collectionPath || !placeId) {
      response.status(400).send("Invalid payload. 'collectionPath' and 'placeId' are required.");
      return;
    }

    const doc = await firestore.collection(collectionPath).doc(placeId).get();
    if (!doc.exists) {
      response.status(404).send("Document not found.");
      return;
    }

    await updateAndReschedule(firestore, tasksClient, collectionPath, placeId, doc.data() as Place);
    response.status(200).send("OK");
  } catch (error) {
    logger.error("Error in setOpenStatus:", error); // Enhanced logging
    response.status(500).send("Internal Server Error");
  }
});
