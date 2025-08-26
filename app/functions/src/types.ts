import * as admin from "firebase-admin";

// Defines the priority levels for ads.
export type Priority = 1 | 2 | 3;

// Represents the data structure for a carousel ad in Firestore.
export interface AdData {
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
