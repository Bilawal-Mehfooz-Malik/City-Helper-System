import { sendEmail } from "./config";
import { generateEmailHtml } from "./helpers";
import * as firestoreFunctions from "firebase-functions/v2/firestore";

const FROM_EMAIL = process.env.FROM_EMAIL!;
const TO_EMAIL = process.env.TO_EMAIL!;

// --- Residence Listing ---
export const onResidenceListingCreated = firestoreFunctions.onDocumentCreated(
  "residence_listings/{docId}",
  async (event) => {
    const snapshot = event.data;
    if (!snapshot) return; 

    const docId = event.params.docId;
    const html = generateEmailHtml("residence", snapshot, docId);

    await sendEmail({
      to: TO_EMAIL,
      from: FROM_EMAIL,
      subject: `New Residence Listing: ${snapshot.data()?.name || docId}`,
      html,
    });
  }
);

export const onResidenceListingDeleted = firestoreFunctions.onDocumentDeleted(
  "residence_listings/{docId}",
  async (event) => {
    const snapshot = event.data;
    if (!snapshot) return;

    const docId = event.params.docId;
    const html = generateEmailHtml("residence", snapshot, docId);

    await sendEmail({
      to: TO_EMAIL,
      from: FROM_EMAIL,
      subject: `Residence Listing Deleted: ${snapshot.data()?.name || docId}`,
      html,
    });
  }
);

// --- Food Listing ---
export const onFoodListingCreated = firestoreFunctions.onDocumentCreated(
  "food_listings/{docId}",
  async (event) => {
    const snapshot = event.data;
    if (!snapshot) return; 

    const docId = event.params.docId;
    const html = generateEmailHtml("food", snapshot, docId);

    await sendEmail({
      to: TO_EMAIL,
      from: FROM_EMAIL,
      subject: `New Food Listing: ${snapshot.data()?.name || docId}`,
      html,
    });
  }
);

export const onFoodListingDeleted = firestoreFunctions.onDocumentDeleted(
  "food_listings/{docId}",
  async (event) => {
    const snapshot = event.data;
    if (!snapshot) return;

    const docId = event.params.docId;
    const html = generateEmailHtml("food", snapshot, docId);

    await sendEmail({
      to: TO_EMAIL,
      from: FROM_EMAIL,
      subject: `Food Listing Deleted: ${snapshot.data()?.name || docId}`,
      html,
    });
  }
);
