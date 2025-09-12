import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';
import 'package:app/src/features/home/presentation/controllers/filter_context.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_controller.g.dart';

@Riverpod(keepAlive: true)
class FilterController extends _$FilterController {
  @override
  EntityFilter build({
    required CategoryId categoryId,
    required FilterContext filterContext,
  }) {
    return switch (categoryId) {
      1 => const EntityFilter.residence(),
      2 => const EntityFilter.food(),
      _ => const EntityFilter.basic(),
    };
  }

  bool get isFood => state is FoodFilter;
  bool get isResidence => state is ResidenceFilter;

  FoodFilter get asFood => state as FoodFilter;
  ResidenceFilter get asResidence => state as ResidenceFilter;

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

  void setSort(SortBy newSortBy) {
    final currentSortBy = state.map(
      residence: (f) => f.sortBy,
      food: (f) => f.sortBy,
      basic: (f) => f.sortBy,
    );

    if (currentSortBy == newSortBy) {
      // Toggle sort order
      toggleSortOrder();
    } else {
      // Set new sort by and default to highToLow
      state = state.map(
        residence: (f) =>
            f.copyWith(sortBy: newSortBy, sortOrder: SortOrder.highToLow),
        food: (f) =>
            f.copyWith(sortBy: newSortBy, sortOrder: SortOrder.highToLow),
        basic: (f) =>
            f.copyWith(sortBy: newSortBy, sortOrder: SortOrder.highToLow),
      );
    }
  }

  void toggleSortOrder() {
    final newSortOrder =
        state.map(
              residence: (f) => f.sortOrder,
              food: (f) => f.sortOrder,
              basic: (f) => f.sortOrder,
            ) ==
            SortOrder.highToLow
        ? SortOrder.lowToHigh
        : SortOrder.highToLow;

    state = state.map(
      residence: (f) => f.copyWith(sortOrder: newSortOrder),
      food: (f) => f.copyWith(sortOrder: newSortOrder),
      basic: (f) => f.copyWith(sortOrder: newSortOrder),
    );
  }

  void setFurnished(bool isFurnished) {
    if (state is ResidenceFilter) {
      state = (state as ResidenceFilter).copyWith(isFurnished: isFurnished);
    }
  }

  void setRoomAvailable(bool isRoomAvailable) {
    if (state is ResidenceFilter) {
      state = (state as ResidenceFilter).copyWith(
        isRoomAvailable: isRoomAvailable,
      );
    }
  }

  void setGender(GenderPreference? gender) {
    state = state.map(
      residence: (f) => f.copyWith(genderPref: gender),
      food: (f) => f.copyWith(genderPref: gender),
      basic: (f) => f, // Basic filter doesn't have gender
    );
  }
}
