// ignore_for_file: invalid_annotation_target

import 'package:app/src/core/models/my_data_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_entitiy.freezed.dart';
part 'search_entitiy.g.dart';

@freezed
abstract class SearchEntity with _$SearchEntity {
  const factory SearchEntity({
    @JsonKey(name: 'objectID') required EntityId id,
    required String name,
    required String cityName,
    required String sectorName,
  }) = _SearchEntity;

  factory SearchEntity.fromJson(Map<String, Object?> json) =>
      _$SearchEntityFromJson(json);
}
