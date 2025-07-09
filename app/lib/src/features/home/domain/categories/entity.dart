import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

abstract class Entity {
  final EntityId id;
  final CategoryId categoryId;
  final SubCategoryId subCategoryId;
  final String coverImageUrl;
  final String name;
  final String cityName;
  final String sectorName;
  final LatLng latLng;
  final double avgRating;
  final int totalReviews;
  final bool isPopular;
  final List<OpeningHours> openingHours;
  final EntityStatus entityStatus;
  // final Status status;
  final DateTime createdAt;

  const Entity({
    required this.id,
    required this.categoryId,
    required this.subCategoryId,
    required this.coverImageUrl,
    required this.name,
    required this.cityName,
    required this.sectorName,
    required this.latLng,
    required this.avgRating,
    required this.totalReviews,
    required this.isPopular,
    required this.openingHours,
    required this.entityStatus,
    // required this.status,
    required this.createdAt,
  });
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

      // Handle overnight timings (e.g., 22:00 to 04:00)
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

  Map<String, dynamic> baseToJson() => {
    'id': id,
    'categoryId': categoryId,
    'subCategoryId': subCategoryId,
    'coverImageUrl': coverImageUrl,
    'name': name,
    'cityName': cityName,
    'sectorName': sectorName,
    'latLng': latLng.toJson(),
    'avgRating': avgRating,
    'totalReviews': totalReviews,
    'isPopular': isPopular,
    'openingHours': openingHours.map((e) => e.toJson()).toList(growable: false),
    'entityStatus': entityStatus.name,
    // 'status': status.name,
    'createdAt': createdAt,
  };

  @override
  int get hashCode => Object.hashAll([
    id,
    categoryId,
    subCategoryId,
    coverImageUrl,
    name,
    cityName,
    sectorName,
    latLng,
    avgRating,
    totalReviews,
    isPopular,
    openingHours,
    entityStatus,
    // status,
    createdAt,
  ]);

  @override
  bool operator ==(Object other);
}
