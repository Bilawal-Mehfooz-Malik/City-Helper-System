import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/models/my_data_types.dart';

class Food extends Entity {
  final GenderPreference genderPref;

  const Food({
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
    required super.isPopular,
    required super.openingHours,
    required super.entityStatus,
    required super.createdAt,
    required this.genderPref,
  });

  bool matchGenderPref(GenderPreference preference) {
    if (preference == GenderPreference.any) return true;
    return genderPref == preference;
  }

  Food copyWith({
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
    bool? isPopular,
    List<OpeningHours>? openingHours,
    EntityStatus? entityStatus,
    DateTime? createdAt,
    GenderPreference? genderPref,
  }) {
    return Food(
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
      isPopular: isPopular ?? this.isPopular,
      openingHours: openingHours ?? this.openingHours,
      entityStatus: entityStatus ?? this.entityStatus,
      createdAt: createdAt ?? this.createdAt,
      genderPref: genderPref ?? this.genderPref,
    );
  }

  Map<String, dynamic> toJson() => {
    ...baseToJson(),
    'genderPref': genderPref.name,
  };

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json['id'] as String,
    categoryId: json['categoryId'] as int,
    subCategoryId: json['subCategoryId'] as int,
    coverImageUrl: json['coverImageUrl'] as String,
    name: json['name'] as String,
    cityName: json['cityName'] as String,
    sectorName: json['sectorName'] as String,
    latLng: LatLng.fromJson(json['latLng'])!,
    avgRating: (json['avgRating'] as num).toDouble(),
    totalReviews: json['totalReviews'] as int,
    isPopular: json['isPopular'] as bool,
    openingHours: (json['openingHours'] as List)
        .map((e) => OpeningHours.fromJson(e as Map<String, dynamic>))
        .toList(),
    entityStatus: EntityStatus.values.byName(json['entityStatus'] as String),
    createdAt: DateTime.parse(json['createdAt'] as String),
    genderPref: GenderPreference.values.byName(json['genderPref'] as String),
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Food && super == other && genderPref == other.genderPref;

  @override
  int get hashCode => super.hashCode ^ genderPref.hashCode;
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
