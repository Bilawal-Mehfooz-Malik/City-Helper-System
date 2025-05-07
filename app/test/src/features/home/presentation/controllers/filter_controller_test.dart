import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/filters/entity_filter.dart';
import 'package:app/src/features/home/domain/filters/food_filter.dart';
import 'package:app/src/features/home/domain/filters/residence_filter.dart';
import 'package:app/src/features/home/presentation/controllers/filter_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  group('FilterController', () {
    test('returns ResidenceFilter when categoryId is 1', () {
      final state = container.read(filterControllerProvider(categoryId: 1));
      expect(state, isA<ResidenceFilter>());
    });

    test('returns FoodFilter when categoryId is 2', () {
      final state = container.read(filterControllerProvider(categoryId: 2));
      expect(state, isA<FoodFilter>());
    });

    test('returns EntityFilter when categoryId is unknown', () {
      final state = container.read(filterControllerProvider(categoryId: 99));
      expect(state, isA<EntityFilter>());
    });

    test('isFood and asFood work correctly', () {
      final notifier = container.read(
        filterControllerProvider(categoryId: 2).notifier,
      );

      expect(notifier.isFood, true);
      expect(notifier.asFood, isA<FoodFilter>());
      expect(notifier.isResidence, false);
    });

    test('isResidence and asResidence work correctly', () {
      final notifier = container.read(
        filterControllerProvider(categoryId: 1).notifier,
      );

      expect(notifier.isResidence, true);
      expect(notifier.asResidence, isA<ResidenceFilter>());
      expect(notifier.isFood, false);
    });

    test('resetFilters resets to initial filter type', () {
      final notifier = container.read(
        filterControllerProvider(categoryId: 1).notifier,
      );

      notifier.updateFilter(isOpen: true);
      expect(notifier.state.isOpen, true);

      notifier.resetFilters();
      expect(notifier.state.isOpen, false);
    });

    test('applyFilter replaces current state', () {
      final notifier = container.read(
        filterControllerProvider(categoryId: 1).notifier,
      );

      final customFilter = ResidenceFilter(isOpen: true, isFurnished: true);
      notifier.applyFilter(customFilter);

      final state = notifier.state;
      expect(state, isA<ResidenceFilter>());
      expect((state as ResidenceFilter).isFurnished, true);
    });

    test('updateFilter modifies specific fields', () {
      final notifier = container.read(
        filterControllerProvider(categoryId: 1).notifier,
      );

      notifier.updateFilter(
        isOpen: true,
        isFurnished: true,
        priceSort: SortOrder.highToLow,
        ratingSort: SortOrder.lowToHigh,
        genderPref: GenderPreference.femaleOnly,
      );

      final state = notifier.state as ResidenceFilter;

      expect(state.isOpen, true);
      expect(state.isFurnished, true);
      expect(state.priceSort, SortOrder.highToLow);
      expect(state.ratingSort, SortOrder.lowToHigh);
      expect(state.genderPref, GenderPreference.femaleOnly);
    });
  });
}
