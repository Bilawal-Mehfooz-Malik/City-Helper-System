import 'package:app/src/core/models/my_data_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
abstract class Entity with _$Entity {
  const factory Entity({
    required EntityId id,
    required UserId userId,
    required CategoryId categoryId,
    required SubCategoryId subCategoryId,
    required String name,
    required String coverImageUrl,
    required bool isPopular,
    required DateTime updatedAt,
  }) = _Entity;

  factory Entity.fromJson(Map<String, Object?> json) => _$EntityFromJson(json);
}
