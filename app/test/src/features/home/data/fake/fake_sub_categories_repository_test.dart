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
        final expected =
            testSubCategories.where((s) => s.categoryId == testId).toList();

        final result = await repository.fetchSubCategoriesList(testId);

        expect(result, expected);
      },
    );

    test(
      'watchSubCategoriesList emits only subcategories for given categoryId',
      () async {
        final CategoryId testId = testSubCategories.last.categoryId;
        final expected =
            testSubCategories.where((s) => s.categoryId == testId).toList();

        expect(repository.watchSubCategoriesList(testId), emits(expected));
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

    test(
      'watchSubCategoriesList emits empty list for non-matching categoryId',
      () {
        const CategoryId unknownId = 0;
        expect(repository.watchSubCategoriesList(unknownId), emits(isEmpty));
      },
    );
  });
}