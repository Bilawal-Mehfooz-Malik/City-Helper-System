import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  group('SubcategoryController', () {
    test('initial state is null', () {
      final initialState = container.read(subcategoryControllerProvider);
      expect(initialState, null);
    });

    test('selectSubcategory updates state from null', () {
      const testSubCategoryId = 10;
      final notifier = container.read(subcategoryControllerProvider.notifier);

      notifier.selectSubcategory(testSubCategoryId);

      final updatedState = container.read(subcategoryControllerProvider);
      expect(updatedState, testSubCategoryId);
    });

    test('selectSubcategory updates state to a different value', () {
      const firstId = 5;
      const secondId = 8;
      final notifier = container.read(subcategoryControllerProvider.notifier);

      notifier.selectSubcategory(firstId);
      notifier.selectSubcategory(secondId);

      final updatedState = container.read(subcategoryControllerProvider);
      expect(updatedState, secondId);
    });

    test('resetSubcategoryState sets the state back to null', () {
      const testId = 7;
      final notifier = container.read(subcategoryControllerProvider.notifier);

      notifier.selectSubcategory(testId);
      notifier.resetSubcategoryState();

      final resetState = container.read(subcategoryControllerProvider);
      expect(resetState, null);
    });
  });
}
