import 'package:app/src/core/models/my_data_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category.freezed.dart';
part 'sub_category.g.dart';

@freezed
abstract class SubCategory with _$SubCategory {
  const factory SubCategory({
    required CategoryId categoryId,
    required CategoryId id,
    required String name,
    required int sortOrder,
  }) = _SubCategory;

  factory SubCategory.fromJson(Map<String, Object?> json) =>
      _$SubCategoryFromJson(json);
}
