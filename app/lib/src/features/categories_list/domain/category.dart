import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/json_converters.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
abstract class Category with _$Category {
  const factory Category({
    required CategoryId id,
    required String name,
    required String description,
    @IconDataConverter() required IconData icon,
    required int sortOrder,
    required DateTime createdAt,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json) =>
      _$CategoryFromJson(json);
}
