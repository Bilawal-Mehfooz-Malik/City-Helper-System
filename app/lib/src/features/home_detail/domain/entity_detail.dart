// ignore_for_file: invalid_annotation_target

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/home/domain/json_converters.dart';
import 'package:app/src/features/home/domain/pricing.dart';
import 'package:app/src/features/home_detail/domain/rating_breakdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'entity_detail.freezed.dart';
part 'entity_detail.g.dart';

// Helpers for JSON conversion
const _latLngJsonConverter = LatLngJsonConverter();
const _timestampJsonConverter = TimestampJsonConverter();
const _openingHoursConverter = OpeningHoursConverter();

@freezed
sealed class EntityDetail with _$EntityDetail {
  const EntityDetail._();

  @JsonSerializable(explicitToJson: true)
  const factory EntityDetail.residence({
    // Core Identifiers & Basic Info
    required EntityId id,
    required CategoryId categoryId,
    required SubCategoryId subCategoryId,
    required String name,
    required String coverImageUrl,

    // Location
    required String cityName,
    required String sectorName,
    @_latLngJsonConverter required LatLng latLng,
    required String streetAddress,

    // Ratings & Popularity
    @Default(0.0) double avgRating,
    @Default(0) int totalReviews,
    @Default(false) bool isPopular,
    @Default([]) List<RatingBreakdown> ratingBreakdown,

    // Operational Status & Timestamps
    @Default(OperationalStatus.defaultStatus)
    OperationalStatus operationalStatus,
    @Default(ApprovalStatus.pending) ApprovalStatus approvalStatus,
    @_timestampJsonConverter required DateTime createdAt,
    @_timestampJsonConverter required DateTime updatedAt,
    @_openingHoursConverter Map<DayOfWeek, OpeningHours>? openingHours,

    // Contact Information
    required UserId ownerId,
    String? phoneNumber,
    String? waNumber,
    String? email,
    String? websiteUrl,
    String? instagramUrl,
    String? facebookUrl,

    // Descriptions & Media
    required String description,
    required List<String> galleryImageUrls,

    // Specific Attributes
    required Pricing pricing,
    @Default(false) bool isFurnished,
    GenderPreference? genderPreference,
    @Default(ListingType.forRent) ListingType listingType,
    @Default(true) bool isRoomAvailable,
  }) = ResidenceDetail;

  @JsonSerializable(explicitToJson: true)
  const factory EntityDetail.food({
    // Core Identifiers & Basic Info
    required EntityId id,
    required CategoryId categoryId,
    required SubCategoryId subCategoryId,
    required String name,
    required String coverImageUrl,

    // Location
    required String cityName,
    required String sectorName,
    @_latLngJsonConverter required LatLng latLng,
    required String streetAddress,

    // Ratings & Popularity
    @Default(0.0) double avgRating,
    @Default(0) int totalReviews,
    @Default(false) bool isPopular,
    @Default([]) List<RatingBreakdown> ratingBreakdown,

    // Operational Status & Timestamps
    @Default(OperationalStatus.defaultStatus)
    OperationalStatus operationalStatus,
    @Default(ApprovalStatus.pending) ApprovalStatus approvalStatus,
    @_timestampJsonConverter required DateTime createdAt,
    @_timestampJsonConverter required DateTime updatedAt,
    @_openingHoursConverter required Map<DayOfWeek, OpeningHours> openingHours,

    // Contact Information
    required UserId ownerId,
    String? phoneNumber,
    String? waNumber,
    String? email,
    String? websiteUrl,
    String? instagramUrl,
    String? facebookUrl,

    // Descriptions & Media
    required String description,
    required List<String> galleryImageUrls,
    required List<String> menuImageUrls,

    // Specific Attributes
    GenderPreference? genderPreference,
  }) = FoodDetail;

  factory EntityDetail.fromJson(Map<String, Object?> json) =>
      _$EntityDetailFromJson(json);
}
