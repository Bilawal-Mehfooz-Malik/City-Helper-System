// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarouselAd _$CarouselAdFromJson(Map<String, dynamic> json) => _CarouselAd(
  id: json['id'] as String,
  businessId: json['businessId'] as String,
  categoryId: (json['categoryId'] as num).toInt(),
  subcategoryId: (json['subcategoryId'] as num?)?.toInt(),
  imageUrl: json['imageUrl'] as String,
  linkType: $enumDecode(_$AdLinkTypeEnumMap, json['linkType']),
  internalProfileId: json['internalProfileId'] as String?,
  externalUrl: json['externalUrl'] as String?,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isActive: json['isActive'] as bool? ?? true,
  priorityScore: (json['priorityScore'] as num?)?.toInt() ?? 1,
  lastShownAt:
      json['lastShownAt'] == null
          ? null
          : DateTime.parse(json['lastShownAt'] as String),
  impressionCount: (json['impressionCount'] as num?)?.toInt() ?? 0,
  clickCount: (json['clickCount'] as num?)?.toInt() ?? 0,
  status:
      $enumDecodeNullable(_$AdApprovalStatusEnumMap, json['status']) ??
      AdApprovalStatus.pending,
);

Map<String, dynamic> _$CarouselAdToJson(_CarouselAd instance) =>
    <String, dynamic>{
      'id': instance.id,
      'businessId': instance.businessId,
      'categoryId': instance.categoryId,
      'subcategoryId': instance.subcategoryId,
      'imageUrl': instance.imageUrl,
      'linkType': _$AdLinkTypeEnumMap[instance.linkType]!,
      'internalProfileId': instance.internalProfileId,
      'externalUrl': instance.externalUrl,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isActive': instance.isActive,
      'priorityScore': instance.priorityScore,
      'lastShownAt': instance.lastShownAt?.toIso8601String(),
      'impressionCount': instance.impressionCount,
      'clickCount': instance.clickCount,
      'status': _$AdApprovalStatusEnumMap[instance.status]!,
    };

const _$AdLinkTypeEnumMap = {
  AdLinkType.internalProfile: 'internalProfile',
  AdLinkType.externalUrl: 'externalUrl',
};

const _$AdApprovalStatusEnumMap = {
  AdApprovalStatus.pending: 'pending',
  AdApprovalStatus.approved: 'approved',
  AdApprovalStatus.rejected: 'rejected',
  AdApprovalStatus.paused: 'paused',
};
