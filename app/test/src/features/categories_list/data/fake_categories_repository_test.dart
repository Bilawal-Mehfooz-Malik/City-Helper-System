import 'package:app/src/features/categories_list/data/fake_categories_repository.dart';
import 'package:app/src/features/categories_list/data/test_categories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FakeCategoriesRepository makeCategoriesRepository() =>
      FakeCategoriesRepository(addDelay: false);

  group('FakeCategoriesRepository', () {
    test('getCategory(1) returns first item', () {
      final categoriesRepository = makeCategoriesRepository();
      expect(categoriesRepository.getCategory(1), testCategories[0]);
    });

    test('getCategory(100) returns null', () {
      final categoriesRepository = makeCategoriesRepository();
      expect(categoriesRepository.getCategory(100), null);
    });
  });

  test('fetchCategoriesList returns global list', () async {
    final categoriesRepository = makeCategoriesRepository();
    expect(await categoriesRepository.fetchCategoriesList(), testCategories);
  });

  test('watchCategoriesList emits global list', () {
    final categoriesRepository = makeCategoriesRepository();
    expect(categoriesRepository.watchCategoriesList(), emits(testCategories));
  });

  test('watchCategory(1) emits first item', () {
    final categoriesRepository = makeCategoriesRepository();
    expect(categoriesRepository.watchCategory(1), emits(testCategories[0]));
  });

  test('watchCategory(100) emits null', () {
    final categoriesRepository = makeCategoriesRepository();
    expect(categoriesRepository.watchCategory(100), emits(null));
  });
}
