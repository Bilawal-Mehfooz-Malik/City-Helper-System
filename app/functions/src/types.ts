export type Priority = 1 | 2 | 3;

export interface AdData {
  id: string;
  businessId: string;
  categoryId: number;
  subcategoryId?: number;
  priorityScore: Priority;
  isActive: boolean;
  status: 'pending' | 'approved' | 'rejected' | 'paused';
  startDate: FirebaseFirestore.Timestamp;
  endDate: FirebaseFirestore.Timestamp;
  createdAt?: FirebaseFirestore.Timestamp;
  updatedAt?: FirebaseFirestore.Timestamp;
  lastShownAt?: FirebaseFirestore.Timestamp | null;
  impressionCount?: number;
  clickCount?: number;
  imageUrl?: string;
  linkType?: 'internalProfile' | 'externalUrl';
  externalUrl?: string;
  internalProfileId?: string;
}

export interface Residence {
  name: string;
  ownerId: string;
  categoryId: number;
}

export interface Food {
  name: string;
  ownerId: string;
  categoryId: number;
}
