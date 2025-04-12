import 'package:app/src/features/home/domain/categories/entity.dart';

class Food extends Entity {
  const Food({
    required super.id,
    required super.categoryId,
    required super.subCategoryId,
    required super.coverImageUrl,
    required super.name,
    required super.cityName,
    required super.sectorName,
    required super.geoLocation,
    required super.avgRating,
    required super.totalReviews,
    required super.isPopular,
    required super.openingHours,
    required super.status,
    required super.createdAt,
  });
}

// @freezed
// abstract class Food extends Entity with _$Food {
//   const Food._({
//     required super.id,
//     required super.categoryId,
//     required super.subCategoryId,
//     required super.coverImageUrl,
//     required super.name,
//     required super.cityName,
//     required super.sectorName,
//     required super.geoLocation,
//     required super.avgRating,
//     required super.totalReviews,
//     required super.isPopular,
//     required super.openingHours,
//     required super.status,
//     required super.createdAt,
//   }) : super();

//   const factory Food({
//     required EntityId id,
//     required CategoryId categoryId,
//     required SubCategoryId subCategoryId,
//     required String coverImageUrl,
//     required String name,
//     required String cityName,
//     required String sectorName,
//     required GeoLocation geoLocation,
//     required double avgRating,
//     required double totalReviews,
//     required bool isPopular,
//     required List<OpeningHours> openingHours,
//     required bool status,
//     required DateTime createdAt,
//   }) = _Food;

//   factory Food.fromJson(Map<String, Object?> json) => _$FoodFromJson(json);
// }
