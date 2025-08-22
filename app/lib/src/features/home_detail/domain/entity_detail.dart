// ignore_for_file: invalid_annotation_target

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/home/domain/json_converters.dart';
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
    required EntityId id,
    required CategoryId categoryId,
    required SubCategoryId subCategoryId,
    required String coverImageUrl,
    required String name,
    required String cityName,
    required String sectorName,
    @_latLngJsonConverter required LatLng latLng,
    @Default(0.0) double avgRating,
    @Default(0) int totalReviews,
    @Default(false) bool isPopular,
    @_openingHoursConverter
    Map<DayOfWeek, OpeningHours>? openingHours,
    @Default(OperationalStatus.defaultStatus) OperationalStatus entityStatus,
    @Default(ApprovalStatus.pending) ApprovalStatus status,
    @_timestampJsonConverter required DateTime createdAt,
    @Default(EntityType.residence) EntityType type,
    @JsonKey(name: 'price') required double pricing,
    @Default(false) bool isFurnished,
    @Default(GenderPreference.any) GenderPreference genderPref,
    @Default(ListingType.forRent) ListingType listingType,
    @Default("Asia/Karachi") String timezone,
    @Default(true) bool isRoomAvailable, // New field
    @Default({}) Map<String, String> scheduledTaskNames,

    // Detail fields
    required UserId ownerId,
    required String description,
    required List<String> galleryImageUrls,
    required String streetAddress,
    @Default([]) List<RatingBreakdown> ratingBreakdown,
    String? phoneNumber,
    String? messagingNumber,
    @_timestampJsonConverter required DateTime updatedAt,
    String? websiteUrl,
    String? instagramUrl,
    String? facebookUrl,
    String? email,
  }) = ResidenceDetail;

  @JsonSerializable(explicitToJson: true)
  const factory EntityDetail.food({
    required EntityId id,
    required CategoryId categoryId,
    required SubCategoryId subCategoryId,
    required String coverImageUrl,
    required String name,
    required String cityName,
    required String sectorName,
    @_latLngJsonConverter required LatLng latLng,
    @Default(0.0) double avgRating,
    @Default(0) int totalReviews,
    @Default(false) bool isPopular,
    @_openingHoursConverter
    required Map<DayOfWeek, OpeningHours> openingHours,
    @Default(OperationalStatus.defaultStatus) OperationalStatus entityStatus,
    @Default(ApprovalStatus.pending) ApprovalStatus status,
    @_timestampJsonConverter required DateTime createdAt,
    @Default(EntityType.food) EntityType type,
    @Default(GenderPreference.any) GenderPreference genderPref,
    @Default("Asia/Karachi") String timezone,
    bool? isOpen,
    @Default({}) Map<String, String> scheduledTaskNames,

    // Detail fields
    required UserId ownerId,
    required String description,
    required List<String> galleryImageUrls,
    required String streetAddress,
    @Default([]) List<RatingBreakdown> ratingBreakdown,
    String? phoneNumber,
    String? messagingNumber,
    @_timestampJsonConverter required DateTime updatedAt,
    String? websiteUrl,
    String? instagramUrl,
    String? facebookUrl,
    String? email,
  }) = FoodDetail;

  factory EntityDetail.fromJson(Map<String, Object?> json) =>
      _$EntityDetailFromJson(json);
}