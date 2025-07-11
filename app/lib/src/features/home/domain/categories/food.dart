import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    required super.status,
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
    Status? status,
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
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      genderPref: genderPref ?? this.genderPref,
    );
  }

  Map<String, dynamic> toJson() => {
    ...baseToJson(),
    'GenderPreference': genderPref.name,
  };

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: _readString(json['id']),
    categoryId: _readInt(json['categoryId']),
    subCategoryId: _readInt(json['subCategoryId']),
    coverImageUrl: _readString(json['coverImageUrl']),
    name: _readString(json['name']),
    cityName: _readString(json['cityName']),
    sectorName: _readString(json['sectorName']),
    latLng: LatLng.fromJson(json['latLng'])!,
    avgRating: _toDouble(json['avgRating']),
    totalReviews: _readInt(json['totalReviews']),
    isPopular: _readBool(json['isPopular']),
    openingHours:
        (json['openingHours'] as List?)
            ?.map((e) => OpeningHours.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    entityStatus: EntityStatus.values.byName(
      _readString(json['entityStatus'], fallback: 'open'),
    ),
    status: Status.values.byName(
      _readString(json['status'], fallback: 'pending'),
    ),
    createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    genderPref: GenderPreference.values.byName(
      _readString(json['GenderPreference'], fallback: 'any'),
    ),
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Food && super == other && genderPref == other.genderPref;

  @override
  int get hashCode => super.hashCode ^ genderPref.hashCode;
}

// Helpers
double _toDouble(dynamic value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

String _readString(dynamic value, {String fallback = ''}) {
  if (value == null) return fallback;
  if (value is String) return value;
  return value.toString();
}

int _readInt(dynamic value, {int fallback = 0}) {
  if (value == null) return fallback;
  if (value is int) return value;
  return int.tryParse(value.toString()) ?? fallback;
}

bool _readBool(dynamic value) {
  return value == true;
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
