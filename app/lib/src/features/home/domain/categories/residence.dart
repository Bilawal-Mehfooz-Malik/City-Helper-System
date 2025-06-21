import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home_detail/domain/rating_breakdown.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    required super.latLng,
    required super.avgRating,
    required super.totalReviews,
    required super.ratingBreakdown,
    required super.isPopular,
    required super.openingHours,
    required super.entityStatus,
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

  Residence copyWith({
    EntityId? id,
    CategoryId? categoryId,
    SubCategoryId? subCategoryId,
    String? coverImageUrl,
    String? name,
    String? cityName,
    String? sectorName,
    LatLng? latLng,
    double? avgRating,
    int? totalReviews,
    List<RatingBreakdown>? ratingBreakdown,
    bool? isPopular,
    List<OpeningHours>? openingHours,
    EntityStatus? entityStatus,
    DateTime? createdAt,
    double? price,
    bool? isFurnished,
    GenderPreference? genderPref,
  }) {
    return Residence(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      name: name ?? this.name,
      cityName: cityName ?? this.cityName,
      sectorName: sectorName ?? this.sectorName,
      latLng: latLng ?? this.latLng,
      avgRating: avgRating ?? this.avgRating,
      totalReviews: totalReviews ?? this.totalReviews,
      ratingBreakdown: ratingBreakdown ?? this.ratingBreakdown,
      isPopular: isPopular ?? this.isPopular,
      openingHours: openingHours ?? this.openingHours,
      entityStatus: entityStatus ?? this.entityStatus,
      createdAt: createdAt ?? this.createdAt,
      price: price ?? this.price,
      isFurnished: isFurnished ?? this.isFurnished,
      genderPref: genderPref ?? this.genderPref,
    );
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
