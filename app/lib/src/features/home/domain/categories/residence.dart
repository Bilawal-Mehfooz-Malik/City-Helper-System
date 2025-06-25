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
    required this.isFurnished,
    required this.genderPref,
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

  Map<String, Object> toJson() => {
    ...baseToJson(),
    'price': price,
    'isFurnished': isFurnished,
    'genderPref': genderPref.name,
    'type': 'residence',
  };

  factory Residence.fromJson(Map<String, Object> json) => Residence(
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
    ratingBreakdown: (json['ratingBreakdown'] as List)
        .map((e) => RatingBreakdown.fromJson(e as Map<String, Object>))
        .toList(),
    isPopular: json['isPopular'] as bool,
    openingHours: (json['openingHours'] as List)
        .map((e) => OpeningHours.fromJson(e as Map<String, Object>))
        .toList(),
    entityStatus: EntityStatus.values.byName(json['entityStatus'] as String),
    createdAt: DateTime.parse(json['createdAt'] as String),
    price: (json['price'] as num).toDouble(),
    isFurnished: json['isFurnished'] as bool,
    genderPref: GenderPreference.values.byName(json['genderPref'] as String),
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Residence &&
          super == other &&
          price == other.price &&
          isFurnished == other.isFurnished &&
          genderPref == other.genderPref;

  @override
  int get hashCode =>
      super.hashCode ^
      price.hashCode ^
      isFurnished.hashCode ^
      genderPref.hashCode;
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
