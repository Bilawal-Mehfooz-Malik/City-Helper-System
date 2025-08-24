import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

// Initialize Firebase Admin if not already initialized
if (!admin.apps.length) {
  admin.initializeApp();
}
const firestore = admin.firestore();

export const migrateResidencePricing = functions.https.onRequest(async (req, res) => {
  try {
    const collectionRef = firestore.collection("residence_listings");
    const snapshot = await collectionRef.get();

    const batch = firestore.batch();
    let updatedCount = 0;

    for (const doc of snapshot.docs) {
      const data = doc.data();
      // Check if the document has the old 'price' field and not the new 'pricing' field
      if (data.price !== undefined && data.pricing === undefined) {
        const oldPrice = data.price;
        let newUnit = "person"; // Default for rentals
        let newPeriod = "oneTime"; // Default for one-time payments (like sales or initial fees)

        // Determine unit and period based on listingType
        if (data.listingType === "forSale") {
          newUnit = "unit"; // More appropriate for a house for sale
          newPeriod = "oneTime"; // Still one-time for a sale
        } else if (data.listingType === "forRent") {
          newUnit = "person"; // Default for rentals, can be adjusted if 'room' is more common
          newPeriod = "month"; // Assuming rentals are typically monthly
        }
        // If listingType is undefined or other, it will use the initial defaults ("person", "oneTime")

        const newPricing = {
          cost: oldPrice,
          unit: newUnit,
          period: newPeriod,
        };

        batch.update(doc.ref, {
          pricing: newPricing,
          price: admin.firestore.FieldValue.delete(), // Remove the old field
        });
        updatedCount++;
      }
    }

    if (updatedCount > 0) {
      await batch.commit();
      res.status(200).send(`Migration complete. Updated ${updatedCount} documents.`);
    } else {
      res.status(200).send("No documents found requiring pricing migration.");
    }
  } catch (error) {
    console.error("Error during pricing migration:", error);
    res.status(500).send("Error during pricing migration.");
  }
});
