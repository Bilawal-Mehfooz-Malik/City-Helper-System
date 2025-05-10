import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';

abstract class EntityDetail extends Entity {
  final String description;
  final List<String> imageUrls;
  final String streetAddress;
  final String? phoneNumber;
  final String? messagingNumber;
  final String? websiteUrl;
  final String? instagramUrl;
  final String? facebookUrl;
  final String? email;
  final DateTime updatedAt;
  final UserId ownerId;

  EntityDetail({
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
    required this.imageUrls,
    required this.streetAddress,
    required this.phoneNumber,
    required this.messagingNumber,
    required this.updatedAt,
    this.websiteUrl,
    this.instagramUrl,
    this.facebookUrl,
    this.email,
  });
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
