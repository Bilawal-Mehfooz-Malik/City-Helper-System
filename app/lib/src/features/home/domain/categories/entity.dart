import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Entity {
  final EntityId id;
  final CategoryId categoryId;
  final SubCategoryId subCategoryId;
  final String coverImageUrl;
  final String name;
  final String cityName;
  final String sectorName;
  final LatLng geoLocation;
  final double avgRating;
  final int totalReviews;
  final bool isPopular;
  final List<OpeningHours> openingHours;
  final bool status;
  final DateTime createdAt;

  const Entity({
    required this.id,
    required this.categoryId,
    required this.subCategoryId,
    required this.coverImageUrl,
    required this.name,
    required this.cityName,
    required this.sectorName,
    required this.geoLocation,
    required this.avgRating,
    required this.totalReviews,
    required this.isPopular,
    required this.openingHours,
    required this.status,
    required this.createdAt,
  });
}
