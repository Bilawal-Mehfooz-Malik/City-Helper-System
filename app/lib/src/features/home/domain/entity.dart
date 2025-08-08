// ignore_for_file: invalid_annotation_target

import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

// Helpers for JSON conversion
const _latLngJsonConverter = LatLngJsonConverter();
const _timestampJsonConverter = TimestampJsonConverter();

@freezed
sealed class Entity with _$Entity {
  const Entity._(); // Private constructor for methods

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
    required double avgRating,
    required int totalReviews,
    required bool isPopular,
    required List<OpeningHours> openingHours,
    required EntityStatus entityStatus,
    required Status status,
    @_timestampJsonConverter required DateTime createdAt,
    required EntityType type,
    required double price,
    required bool isFurnished,
    required GenderPreference genderPref,
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
    required double avgRating,
    required int totalReviews,
    required bool isPopular,
    required List<OpeningHours> openingHours,
    required EntityStatus entityStatus,
    required Status status,
    @_timestampJsonConverter required DateTime createdAt,
    required EntityType type,
    required GenderPreference genderPref,
  }) = Food;

  factory Entity.fromJson(Map<String, Object?> json) => _$EntityFromJson(json);

  bool isEntityOpen() {
    if (entityStatus == EntityStatus.close) return false;
    if (entityStatus == EntityStatus.open) return true;

    final now = DateTime.now().toLocal();
    final currentDay = DateFormat('EEEE').format(now);

    final todayOpeningHours = openingHours.firstWhereOrNull(
      (hours) => hours.day.toLowerCase() == currentDay.toLowerCase(),
    );

    if (todayOpeningHours == null) return false;

    if (todayOpeningHours.open == todayOpeningHours.close) {
      return true; // Open 24 hours
    }

    try {
      final format = DateFormat("HH:mm");

      final openParsed = format.parse(todayOpeningHours.open);
      final closeParsed = format.parse(todayOpeningHours.close);

      final openTime = DateTime(
        now.year,
        now.month,
        now.day,
        openParsed.hour,
        openParsed.minute,
      );
      var closeTime = DateTime(
        now.year,
        now.month,
        now.day,
        closeParsed.hour,
        closeParsed.minute,
      );

      if (closeTime.isBefore(openTime)) {
        closeTime = closeTime.add(const Duration(days: 1));
      }

      return now.isAfter(openTime) && now.isBefore(closeTime);
    } catch (e, st) {
      AppLogger.logError(
        'Opening hour parse error for $name',
        error: e,
        stackTrace: st,
      );
      return false;
    }
  }

  bool matchGenderPref(GenderPreference preference) {
    if (preference == GenderPreference.any) return true;
    return when(
      residence:
          (_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, genderPref) =>
              genderPref == preference,
      food: (_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, genderPref) =>
          genderPref == preference,
    );
  }

  bool checkFurnished(bool furnished) {
    return when(
      residence:
          (_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, isFurnished, _) =>
              isFurnished == furnished,
      food: (_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _) =>
          true, // Not applicable for food
    );
  }
}

// JSON Converters
class LatLngJsonConverter
    implements JsonConverter<LatLng, Map<String, Object?>> {
  const LatLngJsonConverter();

  @override
  LatLng fromJson(Map<String, Object?> json) {
    return LatLng.fromJson(json)!;
  }

  @override
  Map<String, Object?> toJson(LatLng latLng) {
    return latLng.toJson() as Map<String, Object?>;
  }
}

class TimestampJsonConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampJsonConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime object) {
    return Timestamp.fromDate(object);
  }
}

extension FirstWhereOrNull<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) predicate) {
    for (final element in this) {
      if (predicate(element)) {
        return element;
      }
    }
    return null;
  }
}
