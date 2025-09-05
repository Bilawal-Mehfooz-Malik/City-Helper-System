// ignore_for_file: invalid_annotation_target

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/home/domain/json_converters.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app/src/features/home/domain/pricing.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

// Helpers for JSON conversion
const _latLngJsonConverter = LatLngJsonConverter();
const _openingHoursConverter = OpeningHoursConverter();
const _timestampJsonConverter = TimestampJsonConverter();

@freezed
sealed class Entity with _$Entity {
  const Entity._();

  @JsonSerializable(explicitToJson: true)
  const factory Entity.residence({
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
    @_openingHoursConverter Map<DayOfWeek, OpeningHours>? openingHours,
    @Default(ApprovalStatus.pending) ApprovalStatus approvalStatus,
    required Pricing pricing,
    @Default(false) bool isFurnished,
    GenderPreference? genderPreference,
    @Default(ListingType.forRent) ListingType listingType,
    @Default(true) bool isRoomAvailable,
    @_timestampJsonConverter required DateTime updatedAt,
  }) = Residence;

  @JsonSerializable(explicitToJson: true)
  const factory Entity.food({
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
    @_openingHoursConverter required Map<DayOfWeek, OpeningHours> openingHours,
    @Default(OperationalStatus.defaultStatus)
    OperationalStatus operationalStatus,
    @Default(ApprovalStatus.pending) ApprovalStatus approvalStatus,
    GenderPreference? genderPreference,
    @_timestampJsonConverter required DateTime updatedAt,
  }) = Food;

  factory Entity.fromJson(Map<String, Object?> json) => _$EntityFromJson(json);

  factory Entity.fromDetail(EntityDetail detail) {
    return switch (detail) {
      ResidenceDetail() => Residence(
          id: detail.id,
          categoryId: detail.categoryId,
          subCategoryId: detail.subCategoryId,
          coverImageUrl: detail.coverImageUrl,
          name: detail.name,
          cityName: detail.cityName,
          sectorName: detail.sectorName,
          latLng: detail.latLng,
          avgRating: detail.avgRating,
          totalReviews: detail.totalReviews,
          isPopular: detail.isPopular,
          openingHours: detail.openingHours,
          approvalStatus: detail.approvalStatus,
          pricing: detail.pricing,
          isFurnished: detail.isFurnished,
          genderPreference: detail.genderPreference,
          listingType: detail.listingType,
          isRoomAvailable: detail.isRoomAvailable,
          updatedAt: detail.updatedAt,
        ),
      FoodDetail() => Food(
          id: detail.id,
          categoryId: detail.categoryId,
          subCategoryId: detail.subCategoryId,
          coverImageUrl: detail.coverImageUrl,
          name: detail.name,
          cityName: detail.cityName,
          sectorName: detail.sectorName,
          latLng: detail.latLng,
          avgRating: detail.avgRating,
          totalReviews: detail.totalReviews,
          isPopular: detail.isPopular,
          openingHours: detail.openingHours,
          operationalStatus: detail.operationalStatus,
          approvalStatus: detail.approvalStatus,
          genderPreference: detail.genderPreference,
          updatedAt: detail.updatedAt,
        ),
    };
  }
}
