import * as admin from "firebase-admin";

export function generateEmailHtml(entity: string, snapshot: admin.firestore.DocumentSnapshot, docId: string) {
  const data = snapshot.data();
  const link = `https://console.firebase.google.com/project/${process.env.GCLOUD_PROJECT}/firestore/data/~2F${entity}_listings~2F${docId}`;
  return `
    <p><strong>Name:</strong> ${data?.name || "N/A"}</p>
    <p><strong>Owner ID:</strong> ${data?.ownerId || "N/A"}</p>
    <p><strong>Category ID:</strong> ${data?.categoryId || "N/A"}</p>
    <p><strong>Document ID:</strong> ${docId}</p>
    <p><a href="${link}">View in Firebase Console</a></p>
  `;
}

export const toISOString = (timestamp?: admin.firestore.Timestamp | null): string | null => {
  return timestamp ? timestamp.toDate().toISOString() : null;
};
