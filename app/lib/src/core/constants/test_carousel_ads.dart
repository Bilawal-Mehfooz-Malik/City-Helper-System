import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/carousel_ad.dart';

// Helper variable for date calculations
final now = DateTime.now();

final List<CarouselAd> testCarouselAds = [
  // --- Residences (Category 1) ---

  // Active and valid ad with a subcategory
  CarouselAd(
    id: 'res_feat_1',
    businessId: 'biz_res_1',
    categoryId: 1, // Residences
    subcategoryId: 101, // e.g., 'Apartments'
    imageUrl: "assets/carousel_ads/image_1.jpg",
    linkType: AdLinkType.internalProfile,
    internalProfileId: 'entity_res_1',
    startDate: now.subtract(const Duration(days: 5)),
    endDate: now.add(const Duration(days: 30)),
    createdAt: now.subtract(const Duration(days: 10)),
    updatedAt: now.subtract(const Duration(hours: 1)),
    isActive: true,
    priorityScore: 3,
    lastShownAt: now.subtract(const Duration(hours: 2)),
    impressionCount: 150,
    clickCount: 15,
    status: AdApprovalStatus.approved,
  ),

  // Active and valid ad without a subcategory
  CarouselAd(
    id: 'res_feat_2',
    businessId: 'biz_res_2',
    categoryId: 1, // Residences
    imageUrl: "assets/carousel_ads/image_1.jpg",
    linkType: AdLinkType.externalUrl,
    externalUrl: "https://example.com/residence/featured-luxury",
    startDate: now.subtract(const Duration(days: 5)),
    endDate: now.add(const Duration(days: 30)),
    createdAt: now.subtract(const Duration(days: 10)),
    updatedAt: now,
    isActive: true,
    priorityScore: 2,
    lastShownAt: now.subtract(const Duration(hours: 1)),
    impressionCount: 140,
    clickCount: 14,
    status: AdApprovalStatus.approved,
  ),

  // --- Food (Category 2) ---

  // Active and valid ad for a different category
  CarouselAd(
    id: 'food_feat_1',
    businessId: 'biz_food_1',
    categoryId: 2, // Food
    subcategoryId: 201, // e.g., 'Restaurants'
    imageUrl: "assets/carousel_ads/image_1.jpg",
    linkType: AdLinkType.internalProfile,
    internalProfileId: 'entity_food_1',
    startDate: now.subtract(const Duration(days: 2)),
    endDate: now.add(const Duration(days: 60)),
    createdAt: now.subtract(const Duration(days: 7)),
    updatedAt: now,
    isActive: true,
    priorityScore: 3,
    lastShownAt: now.subtract(const Duration(minutes: 30)),
    impressionCount: 120,
    clickCount: 12,
    status: AdApprovalStatus.approved,
  ),

  // --- Ads with different statuses to test filtering ---

  // Pending ad (should not be fetched)
  CarouselAd(
    id: 'res_pending_1',
    businessId: 'biz_res_pending',
    categoryId: 1,
    imageUrl: "assets/carousel_ads/image_1.jpg",
    linkType: AdLinkType.externalUrl,
    externalUrl: "https://example.com/pending-ad",
    startDate: now.subtract(const Duration(days: 5)),
    endDate: now.add(const Duration(days: 30)),
    createdAt: now.subtract(const Duration(days: 1)),
    updatedAt: now.subtract(const Duration(days: 1)),
    isActive: true,
    priorityScore: 3,
    status: AdApprovalStatus.pending, // Should not be fetched
  ),

  // Inactive ad (should not be fetched)
  CarouselAd(
    id: 'res_paused_1',
    businessId: 'biz_res_paused',
    categoryId: 1,
    imageUrl: "assets/carousel_ads/image_1.jpg",
    linkType: AdLinkType.externalUrl,
    externalUrl: "https://example.com/paused-ad",
    startDate: now.subtract(const Duration(days: 5)),
    endDate: now.add(const Duration(days: 30)),
    createdAt: now.subtract(const Duration(days: 2)),
    updatedAt: now.subtract(const Duration(days: 2)),
    isActive: false, // Should not be fetched
    priorityScore: 3,
    status: AdApprovalStatus.approved,
  ),

  // Expired ad (should not be fetched)
  CarouselAd(
    id: 'res_expired_1',
    businessId: 'biz_res_expired',
    categoryId: 1,
    imageUrl: "assets/carousel_ads/image_1.jpg",
    linkType: AdLinkType.externalUrl,
    externalUrl: "https://example.com/expired-ad",
    startDate: now.subtract(const Duration(days: 10)),
    endDate: now.subtract(const Duration(days: 1)), // Expired
    createdAt: now.subtract(const Duration(days: 15)),
    updatedAt: now.subtract(const Duration(days: 15)),
    isActive: true,
    priorityScore: 3,
    status: AdApprovalStatus.approved,
  ),
];
