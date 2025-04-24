import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';

class Residence extends Entity {
  final double price;
  final bool isFurnished;
  final GenderPreference genderPref;

  const Residence({
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
    required this.price,
    required this.genderPref,
    required this.isFurnished,
  });

  bool matchGenderPref(GenderPreference preference) {
    if (preference == GenderPreference.any) return true;
    return genderPref == preference;
  }

  bool checkFurnished(bool furnished) {
    return isFurnished == furnished;
  }
}

// @freezed
// abstract class Residence extends Entity with _$Residence {
//   const Residence._({
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

//   const factory Residence({
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

//     // New fields
//     required double price,
//     required GenderPreference filters,
//     required bool isFurnished,
//   }) = _Residence;

//   factory Residence.fromJson(Map<String, Object?> json) =>
//       _$ResidenceFromJson(json);
// }
