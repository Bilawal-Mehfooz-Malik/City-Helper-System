import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_controller.g.dart';

@Riverpod(keepAlive: true)
class FilterController extends _$FilterController {
  @override
  EntityFilter build({required CategoryId categoryId}) {
    return switch (categoryId) {
      1 => const EntityFilter.residence(),
      2 => const EntityFilter.food(),
      _ => const EntityFilter.basic(),
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
    state = state.when(
      residence: (_, _, _, _, _) => const EntityFilter.residence(),
      food: (_, _, _) => const EntityFilter.food(),
      basic: (_, _) => const EntityFilter.basic(),
    );
  }

  void updateFilter({
    bool? isOpen,
    bool? isFurnished,
    SortOrder? priceSort,
    SortOrder? ratingSort,
    GenderPreference? genderPref,
  }) {
    state = state.when(
      residence:
          (
            currentIsOpen,
            currentRatingSort,
            currentIsFurnished,
            currentPriceSort,
            currentGenderPref,
          ) => EntityFilter.residence(
            isOpen: isOpen ?? currentIsOpen,
            ratingSort: ratingSort ?? currentRatingSort,
            isFurnished: isFurnished ?? currentIsFurnished,
            priceSort: priceSort ?? currentPriceSort,
            genderPref: genderPref ?? currentGenderPref,
          ),
      food: (currentIsOpen, currentRatingSort, currentGenderPref) =>
          EntityFilter.food(
            isOpen: isOpen ?? currentIsOpen,
            ratingSort: ratingSort ?? currentRatingSort,
            genderPref: genderPref ?? currentGenderPref,
          ),
      basic: (currentIsOpen, currentRatingSort) => EntityFilter.basic(
        isOpen: isOpen ?? currentIsOpen,
        ratingSort: ratingSort ?? currentRatingSort,
      ),
    );
  }
}
