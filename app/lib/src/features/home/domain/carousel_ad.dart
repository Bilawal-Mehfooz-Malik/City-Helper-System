import 'package:app/src/core/models/my_data_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'carousel_ad.freezed.dart';
part 'carousel_ad.g.dart';

@freezed
abstract class CarouselAd with _$CarouselAd {
  const factory CarouselAd({
    required CarouselAdId id, // Unique ad identifier
    required BusinessId businessId, // ID of the owning business/shop
    required CategoryId categoryId, // e.g., CategoryId (int)
    SubCategoryId? subcategoryId, // Optional: ID of the subcategory
    required String imageUrl, // URL to the 16:9 ad banner image
    required AdLinkType linkType, // "internal_profile" or "external_url"
    EntityId?
    internalProfileId, // Conditional: ID of the in-app profile to link to
    String? externalUrl, // Conditional: Full URL to an external website
    required DateTime startDate, // When the ad starts showing
    required DateTime endDate, // When the ad stops showing
    required DateTime createdAt, // Ad creation timestamp
    required DateTime updatedAt, // Last update timestamp
    @Default(true) bool isActive, // True if ad is active
    @Default(1)
    int
    priorityScore, // Numerical priority: 1 (Basic), 2 (Premium), 3 (Featured)
    DateTime? lastShownAt, // Timestamp of the last time this ad was shown
    @Default(0) int impressionCount, // Number of times ad has been shown
    @Default(0) int clickCount, // Number of times ad has been clicked
    @Default(AdApprovalStatus.pending)
    AdApprovalStatus
    status, // Approval status: "pending", "approved", "rejected", "paused"
  }) = _CarouselAd;

  factory CarouselAd.fromJson(Map<String, Object?> json) =>
      _$CarouselAdFromJson(json);
}
