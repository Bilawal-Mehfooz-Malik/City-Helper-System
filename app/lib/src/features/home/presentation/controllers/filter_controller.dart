import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/filters/entity_filter.dart';
import 'package:app/src/features/home/domain/filters/food_filter.dart';
import 'package:app/src/features/home/domain/filters/residence_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_controller.g.dart';

@Riverpod(keepAlive: true)
class FilterController extends _$FilterController {
  @override
  EntityFilter build({required CategoryId category}) {
    return switch (category) {
      1 => ResidenceFilter(),
      2 => FoodFilter(),
      _ => EntityFilter(),
    };
  }

  bool get isFood => state is FoodFilter;
  bool get isResidence => state is ResidenceFilter;

  FoodFilter? get asFood => state is FoodFilter ? state as FoodFilter : null;
  ResidenceFilter? get asResidence =>
      state is ResidenceFilter ? state as ResidenceFilter : null;

  void applyFilter(EntityFilter newFilter) {
    state = newFilter;
  }

  void resetFilters() {
    state = switch (state) {
      ResidenceFilter _ => ResidenceFilter(),
      FoodFilter _ => FoodFilter(),
      _ => EntityFilter(),
    };
  }

  void updateFilter({
    bool? isOpen,
    bool? isFurnished,
    SortOrder? priceSort,
    SortOrder? ratingSort,
    GenderPreference? genderPref,
  }) {
    state = switch (state) {
      ResidenceFilter current => current.copyWith(
        isOpen: isOpen,
        isFurnished: isFurnished,
        priceSort: priceSort,
        ratingSort: ratingSort,
        genderPref: genderPref,
      ),
      FoodFilter current => current.copyWith(
        isOpen: isOpen,
        ratingSort: ratingSort,
        genderPref: genderPref,
      ),
      EntityFilter current => current.copyWith(
        isOpen: isOpen,
        ratingSort: ratingSort,
      ),
    };
  }
}
