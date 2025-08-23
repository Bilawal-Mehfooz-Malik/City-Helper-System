import 'package:app/src/core/models/my_data_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_filter.freezed.dart';

@freezed
sealed class EntityFilter with _$EntityFilter {
  const EntityFilter._();

  const factory EntityFilter.food({
    @Default(SortOrder.none) SortOrder ratingSort,
    @Default(GenderPreference.any) GenderPreference genderPref,
  }) = FoodFilter;

  const factory EntityFilter.residence({
    @Default(SortOrder.none) SortOrder ratingSort,
    @Default(false) bool isFurnished,
    @Default(false) bool isRoomAvailable,
    @Default(SortOrder.none) SortOrder priceSort,
    @Default(GenderPreference.any) GenderPreference genderPref,
  }) = ResidenceFilter;

  const factory EntityFilter.basic({
    @Default(SortOrder.none) SortOrder ratingSort,
  }) = BasicFilter;

  /// A generic getter for ratingSort that works across all filter types.
  SortOrder get getRatingSort => when(
    food: (ratingSort, _) => ratingSort,
    residence: (ratingSort, _, _, _, _) => ratingSort,
    basic: (ratingSort) => ratingSort,
  );
}
