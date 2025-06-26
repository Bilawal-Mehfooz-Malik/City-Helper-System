import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/rating_breakdown.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodDetail extends EntityDetail {
  final GenderPreference genderPref;

  FoodDetail({
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
    required super.ownerId,
    required super.description,
    required super.imageUrls,
    required super.streetAddress,
    required super.phoneNumber,
    required super.messagingNumber,
    required super.updatedAt,
    super.email,
    super.facebookUrl,
    super.instagramUrl,
    super.websiteUrl,
    required this.genderPref,
  });

  @override
  FoodDetail copyWith({
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
    UserId? ownerId,
    String? description,
    List<String>? imageUrls,
    String? streetAddress,
    String? phoneNumber,
    String? messagingNumber,
    String? websiteUrl,
    String? instagramUrl,
    String? facebookUrl,
    String? email,
    DateTime? updatedAt,
    GenderPreference? genderPref,
  }) {
    return FoodDetail(
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
      ownerId: ownerId ?? this.ownerId,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
      streetAddress: streetAddress ?? this.streetAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      messagingNumber: messagingNumber ?? this.messagingNumber,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      instagramUrl: instagramUrl ?? this.instagramUrl,
      facebookUrl: facebookUrl ?? this.facebookUrl,
      email: email ?? this.email,
      updatedAt: updatedAt ?? this.updatedAt,
      genderPref: genderPref ?? this.genderPref,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'genderPref': genderPref.name,
  };

  factory FoodDetail.fromJson(Map<String, dynamic> json) {
    return FoodDetail(
      id: json['id'] as EntityId,
      categoryId: json['categoryId'] as CategoryId,
      subCategoryId: json['subCategoryId'] as SubCategoryId,
      coverImageUrl: json['coverImageUrl'] as String,
      name: json['name'] as String,
      cityName: json['cityName'] as String,
      sectorName: json['sectorName'] as String,
      latLng: LatLng.fromJson(json['latLng'])!,
      avgRating: (json['avgRating'] as num).toDouble(),
      totalReviews: json['totalReviews'] as int,
      ratingBreakdown: (json['ratingBreakdown'] as List<dynamic>)
          .map((e) => RatingBreakdown.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPopular: json['isPopular'] as bool,
      openingHours: (json['openingHours'] as List<dynamic>)
          .map((e) => OpeningHours.fromJson(e as Map<String, dynamic>))
          .toList(),
      entityStatus: EntityStatus.values.byName(json['entityStatus'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      ownerId: json['ownerId'] as UserId,
      description: json['description'] as String,
      imageUrls: List<String>.from(json['imageUrls'] as List),
      streetAddress: json['streetAddress'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      messagingNumber: json['messagingNumber'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
      instagramUrl: json['instagramUrl'] as String?,
      facebookUrl: json['facebookUrl'] as String?,
      email: json['email'] as String?,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      genderPref: GenderPreference.values.byName(json['genderPref'] as String),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FoodDetail && super == other && genderPref == other.genderPref;
  }

  @override
  int get hashCode => Object.hashAll([super.hashCode, genderPref]);
}
