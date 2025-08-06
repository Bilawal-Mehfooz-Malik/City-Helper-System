import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/features/categories_list/presentation/controllers/selected_category_view_controller.dart';

void main() {
  group('SelectedCategoryViewController', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('build returns SelectedCategoryView.home initially', () {
      final controller = container.read(selectedCategoryViewControllerProvider.notifier);
      expect(controller.build(), SelectedCategoryView.home);
    });

    test('setSelectedCategoryView updates the state correctly', () {
      final controller = container.read(selectedCategoryViewControllerProvider.notifier);

      // Initial state
      expect(container.read(selectedCategoryViewControllerProvider), SelectedCategoryView.home);

      // Update to popular
      controller.setSelectedCategoryView(SelectedCategoryView.popular);
      expect(container.read(selectedCategoryViewControllerProvider), SelectedCategoryView.popular);

      // Update back to home
      controller.setSelectedCategoryView(SelectedCategoryView.home);
      expect(container.read(selectedCategoryViewControllerProvider), SelectedCategoryView.home);
    });
  });
}
