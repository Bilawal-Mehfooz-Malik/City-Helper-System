import 'package:app/src/core/models/my_data_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_filter.freezed.dart';

enum SortBy {
  updatedAt,
  rating,
  price,
}

@freezed
sealed class EntityFilter with _$EntityFilter {
  const EntityFilter._();

  const factory EntityFilter.food({
    @Default(SortBy.updatedAt) SortBy sortBy,
    @Default(SortOrder.highToLow) SortOrder sortOrder,
    GenderPreference? genderPref,
  }) = FoodFilter;

  const factory EntityFilter.residence({
    @Default(SortBy.updatedAt) SortBy sortBy,
    @Default(SortOrder.highToLow) SortOrder sortOrder,
    @Default(false) bool isFurnished,
    @Default(false) bool isRoomAvailable,
    GenderPreference? genderPref,
  }) = ResidenceFilter;

  const factory EntityFilter.basic({
    @Default(SortBy.rating) SortBy sortBy,
    @Default(SortOrder.highToLow) SortOrder sortOrder,
  }) = BasicFilter;
}