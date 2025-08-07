// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarouselAd _$CarouselAdFromJson(Map<String, dynamic> json) => _CarouselAd(
  categoryId: (json['categoryId'] as num).toInt(),
  subCategoryId: (json['subCategoryId'] as num).toInt(),
  id: json['id'] as String,
  imageUrl: json['imageUrl'] as String,
  targetUrl: json['targetUrl'] as String,
  validFrom: DateTime.parse(json['validFrom'] as String),
  validUntil: DateTime.parse(json['validUntil'] as String),
  status:
      $enumDecodeNullable(_$AdStatusEnumMap, json['status']) ?? AdStatus.active,
);

Map<String, dynamic> _$CarouselAdToJson(_CarouselAd instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'subCategoryId': instance.subCategoryId,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'targetUrl': instance.targetUrl,
      'validFrom': instance.validFrom.toIso8601String(),
      'validUntil': instance.validUntil.toIso8601String(),
      'status': _$AdStatusEnumMap[instance.status]!,
    };

const _$AdStatusEnumMap = {
  AdStatus.active: 'active',
  AdStatus.paused: 'paused',
  AdStatus.archived: 'archived',
};
