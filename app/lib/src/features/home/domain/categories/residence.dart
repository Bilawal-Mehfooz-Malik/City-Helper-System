import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    required super.isPopular,
    required super.openingHours,
    required super.entityStatus,
    required super.status,
    required super.createdAt,
    required super.type,
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
    bool? isPopular,
    List<OpeningHours>? openingHours,
    EntityStatus? entityStatus,
    Status? status,
    DateTime? createdAt,
    double? price,
    bool? isFurnished,
    EntityType? type,
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
      isPopular: isPopular ?? this.isPopular,
      openingHours: openingHours ?? this.openingHours,
      entityStatus: entityStatus ?? this.entityStatus,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      price: price ?? this.price,
      isFurnished: isFurnished ?? this.isFurnished,
      type: type ?? this.type,
      genderPref: genderPref ?? this.genderPref,
    );
  }

  Map<String, dynamic> toJson() => {
    ...baseToJson(),
    'price': price,
    'isFurnished': isFurnished,
    'GenderPreference': genderPref.name,
  };

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
    id: json['id'] as EntityId,
    categoryId: json['categoryId'] as CategoryId,
    subCategoryId: json['subCategoryId'] as SubCategoryId,
    coverImageUrl: json['coverImageUrl'] as String,
    name: json['name'] as String,
    cityName: json['cityName'] as String,
    sectorName: json['sectorName'] as String,
    latLng: LatLng.fromJson(json['latLng'])!,
    avgRating: (json['avgRating'] as num?)?.toDouble() ?? 0.0,
    totalReviews: (json['totalReviews'] as int?) ?? 0,
    price: (json['price'] as num?)?.toDouble() ?? 0.0,

    isPopular: json['isPopular'] as bool,
    openingHours: (json['openingHours'] as List)
        .map((e) => OpeningHours.fromJson(e as Map<String, dynamic>))
        .toList(),
    entityStatus: EntityStatus.values.byName(json['entityStatus'] as String),
    status: Status.values.byName(
      _readString(json['status'], fallback: 'pending'),
    ),
    type: EntityType.values.byName(
      _readString(json['type'], fallback: 'residence'),
    ),
    createdAt: (json['createdAt'] as Timestamp).toDate(),
    isFurnished: json['isFurnished'] as bool,
    genderPref: GenderPreference.values.byName(
      json['GenderPreference'] as String,
    ),
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

String _readString(dynamic value, {String fallback = ''}) {
  if (value == null) return fallback;
  if (value is String) return value;
  return value.toString();
}
