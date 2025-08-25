import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/features/home/data/fake/fake_sub_categories_repository.dart';
import 'package:app/src/core/constants/test_sub_categories.dart';
import 'package:app/src/core/models/my_data_types.dart';

void main() {
  late FakeSubCategoriesRepository repository;

  setUp(() {
    repository = FakeSubCategoriesRepository(addDelay: false);
  });

  group('FakeSubCategoriesRepository', () {
    test(
      'fetchSubCategoriesList returns only subcategories for given categoryId',
      () async {
        final CategoryId testId = testSubCategories.first.categoryId;
        final expected = testSubCategories
            .where((s) => s.categoryId == testId)
            .toList();

        final result = await repository.fetchSubCategoriesList(testId);

        expect(result, expected);
      },
    );

    test(
      'fetchSubCategoriesList returns empty list for non-matching categoryId',
      () async {
        const CategoryId unknownId = 0;
        final result = await repository.fetchSubCategoriesList(unknownId);
        expect(result, isEmpty);
      },
    );

    test('fetchSubCategory returns correct subcategory by id', () async {
      final subCategory = testSubCategories.first;
      final result = await repository.fetchSubCategory(subCategory.id);
      expect(result, subCategory);
    });

    test('fetchSubCategory returns null for invalid id', () async {
      const SubCategoryId invalidId = 9999;
      final result = await repository.fetchSubCategory(invalidId);
      expect(result, isNull);
    });
  });
}
