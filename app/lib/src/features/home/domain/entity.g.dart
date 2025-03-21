// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntityImpl _$$EntityImplFromJson(Map<String, dynamic> json) => _$EntityImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      categoryId: (json['categoryId'] as num).toInt(),
      subCategoryId: (json['subCategoryId'] as num).toInt(),
      name: json['name'] as String,
      coverImageUrl: json['coverImageUrl'] as String,
      isPopular: json['isPopular'] as bool,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$EntityImplToJson(_$EntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'subCategoryId': instance.subCategoryId,
      'name': instance.name,
      'coverImageUrl': instance.coverImageUrl,
      'isPopular': instance.isPopular,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
