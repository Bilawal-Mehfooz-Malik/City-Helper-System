import { initializeApp } from "firebase-admin/app";
import { getFirestore } from "firebase-admin/firestore";
import { CloudTasksClient } from "@google-cloud/tasks";
import { onDocumentWritten } from "firebase-functions/v2/firestore";
import { onRequest } from "firebase-functions/v2/https";
import { updateAndReschedule } from "./core";
import { Place } from "./types";

// INITIALIZATION
initializeApp();
const tasksClient = new CloudTasksClient();
const firestore = getFirestore();

// CLOUD FUNCTION TRIGGERS
const collections = ["food_listings"];
for (const collection of collections) {
  exports[`onWrite_${collection}`] = onDocumentWritten(`${collection}/{placeId}`, async (event) => {
    await updateAndReschedule(firestore, tasksClient, collection, event.params.placeId, event.data?.after.data() as Place | undefined);
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
    response.status(500).send("Internal Server Error");
  }
});
