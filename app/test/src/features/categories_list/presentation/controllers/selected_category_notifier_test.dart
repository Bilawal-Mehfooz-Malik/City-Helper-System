import 'package:app/src/features/categories_list/presentation/controllers/selected_category_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  group('SelectedCategoryIdNotifier', () {
    test('initial state is null', () {
      final initialState = container.read(selectedCategoryNotifierProvider);
      expect(initialState, null);
    });

    test('setCategoryId updates state from null', () {
      const testId = 1;
      final notifier = container.read(
        selectedCategoryNotifierProvider.notifier,
      );

      notifier.setCategoryId(testId);

      final updatedState = container.read(selectedCategoryNotifierProvider);
      expect(updatedState, testId);
    });

    test(
      'setCategoryId updates state from an existing value to a different value',
      () {
        const firstId = 1;
        const secondId = 2;
        final notifier = container.read(
          selectedCategoryNotifierProvider.notifier,
        );

        notifier.setCategoryId(firstId);
        notifier.setCategoryId(secondId);

        final finalState = container.read(selectedCategoryNotifierProvider);
        expect(finalState, secondId);
      },
    );

    test('setCategoryId with the same value does not change the state', () {
      const testId = 1;
      final notifier = container.read(
        selectedCategoryNotifierProvider.notifier,
      );

      notifier.setCategoryId(testId);
      final stateAfterFirstSet = container.read(
        selectedCategoryNotifierProvider,
      );
      expect(stateAfterFirstSet, testId);

      notifier.setCategoryId(testId);
      final stateAfterSecondSet = container.read(
        selectedCategoryNotifierProvider,
      );
      expect(stateAfterSecondSet, testId);
    });
  });
}
