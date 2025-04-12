// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EntityDetail _$EntityDetailFromJson(Map<String, dynamic> json) =>
    _EntityDetail(
      entityId: json['entityId'] as String,
      userId: json['userId'] as String,
      categoryId: (json['categoryId'] as num).toInt(),
      subCategoryId: (json['subCategoryId'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      imagesUrls:
          (json['imagesUrls'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      videoUrl: json['videoUrl'] as String,
      avgRating: (json['avgRating'] as num).toDouble(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      shopAddress: json['shopAddress'] as String,
      shopGeoPoints: json['shopGeoPoints'] as String,
      phoneNum: json['phoneNum'] as String?,
      msgNum: json['msgNum'] as String?,
      webUrl: json['webUrl'] as String?,
      instaUrl: json['instaUrl'] as String?,
      fbUrl: json['fbUrl'] as String?,
      emailAddress: json['emailAddress'] as String?,
    );

Map<String, dynamic> _$EntityDetailToJson(_EntityDetail instance) =>
    <String, dynamic>{
      'entityId': instance.entityId,
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'subCategoryId': instance.subCategoryId,
      'name': instance.name,
      'description': instance.description,
      'imagesUrls': instance.imagesUrls,
      'videoUrl': instance.videoUrl,
      'avgRating': instance.avgRating,
      'reviewsCount': instance.reviewsCount,
      'shopAddress': instance.shopAddress,
      'shopGeoPoints': instance.shopGeoPoints,
      'phoneNum': instance.phoneNum,
      'msgNum': instance.msgNum,
      'webUrl': instance.webUrl,
      'instaUrl': instance.instaUrl,
      'fbUrl': instance.fbUrl,
      'emailAddress': instance.emailAddress,
    };
