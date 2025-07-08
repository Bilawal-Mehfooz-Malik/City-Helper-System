import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home_detail/domain/rating_breakdown.dart';

abstract class EntityDetail extends Entity {
  final String description;
  final List<String> galleryImageUrls;
  final String streetAddress;
  final String? phoneNumber;
  final String? messagingNumber;
  final String? websiteUrl;
  final String? instagramUrl;
  final String? facebookUrl;
  final String? email;
  final DateTime updatedAt;
  final UserId ownerId;
  final List<RatingBreakdown> ratingBreakdown;

  const EntityDetail({
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

    required this.ownerId,
    required this.description,
    required this.galleryImageUrls,
    required this.streetAddress,
    required this.ratingBreakdown,
    this.phoneNumber,
    this.messagingNumber,
    required this.updatedAt,
    this.websiteUrl,
    this.instagramUrl,
    this.facebookUrl,
    this.email,
  });

  Map<String, dynamic> toJson() => {
    ...super.baseToJson(),
    'ownerId': ownerId,
    'description': description,
    'galleryImageUrls': galleryImageUrls,
    'streetAddress': streetAddress,
    'phoneNumber': phoneNumber,
    'messagingNumber': messagingNumber,
    'websiteUrl': websiteUrl,
    'instagramUrl': instagramUrl,
    'facebookUrl': facebookUrl,
    'email': email,
    'updatedAt': updatedAt,
    'ratingBreakdown': ratingBreakdown.map((e) => e.toJson()).toList(),
  };

  EntityDetail copyWith({
    String? description,
    List<String>? galleryImageUrls,
    String? streetAddress,
    String? phoneNumber,
    String? messagingNumber,
    String? websiteUrl,
    String? instagramUrl,
    String? facebookUrl,
    String? email,
    DateTime? updatedAt,
    UserId? ownerId,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is EntityDetail &&
            super == other &&
            runtimeType == other.runtimeType &&
            description == other.description &&
            galleryImageUrls == other.galleryImageUrls &&
            streetAddress == other.streetAddress &&
            phoneNumber == other.phoneNumber &&
            messagingNumber == other.messagingNumber &&
            websiteUrl == other.websiteUrl &&
            instagramUrl == other.instagramUrl &&
            facebookUrl == other.facebookUrl &&
            email == other.email &&
            updatedAt == other.updatedAt &&
            ownerId == other.ownerId;
  }

  @override
  int get hashCode => Object.hashAll([
    super.hashCode,
    description,
    galleryImageUrls,
    streetAddress,
    phoneNumber,
    messagingNumber,
    websiteUrl,
    instagramUrl,
    facebookUrl,
    email,
    updatedAt,
    ownerId,
  ]);
}

// import 'package:app/src/core/models/my_data_types.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'entity_detail.freezed.dart';
// part 'entity_detail.g.dart';

// @freezed
// abstract class EntityDetail with _$EntityDetail {
//   const factory EntityDetail({
//     required EntityId entityId,
//     required UserId userId,
//     required CategoryId categoryId,
//     required SubCategoryId subCategoryId,
//     required String name,
//     required String description,
//     required List<String> imagesUrls,
//     required String videoUrl,
//     required double avgRating,
//     required int reviewsCount,
//     required String shopAddress,
//     required String shopGeoPoints,
//     String? phoneNum,
//     String? msgNum,
//     String? webUrl,
//     String? instaUrl,
//     String? fbUrl,
//     String? emailAddress,
//   }) = _EntityDetail;

//   factory EntityDetail.fromJson(Map<String, Object?> json) =>
//       _$EntityDetailFromJson(json);
// }
