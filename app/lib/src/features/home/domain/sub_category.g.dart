// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => _SubCategory(
  categoryId: (json['categoryId'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  sortOrder: (json['sortOrder'] as num).toInt(),
);

Map<String, dynamic> _$SubCategoryToJson(_SubCategory instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'id': instance.id,
      'name': instance.name,
      'sortOrder': instance.sortOrder,
    };
