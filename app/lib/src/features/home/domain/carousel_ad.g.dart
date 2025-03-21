// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarouselAdImpl _$$CarouselAdImplFromJson(Map<String, dynamic> json) =>
    _$CarouselAdImpl(
      categoryId: (json['categoryId'] as num).toInt(),
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      targetUrl: json['targetUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CarouselAdImplToJson(_$CarouselAdImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'targetUrl': instance.targetUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };
