import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/features/home/data/fake/fake_food_repository.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';
import 'package:app/src/core/constants/test_food_list.dart';

void main() {
  late FoodRepository repository;

  setUp(() {
    repository = FakeFoodRepository(addDelay: false);
  });

  group('General Food List', () {
    test('fetchFoodsList returns foods by categoryId', () async {
      final food = testFoods.first;
      final expected =
          testFoods.where((f) => f.categoryId == food.categoryId).toList();

      final result = await repository.fetchFoodsList(food.categoryId);
      expect(result, expected);
    });

    test('watchFoodsList emits foods by categoryId', () {
      final food = testFoods.first;
      final expected =
          testFoods.where((f) => f.categoryId == food.categoryId).toList();

      expect(repository.watchFoodsList(food.categoryId), emits(expected));
    });
  });

  group('Popular Food List', () {
    test('fetchPopularFoodsList returns popular foods by categoryId', () async {
      final food = testFoods.first;
      final expected =
          testFoods
              .where((f) => f.categoryId == food.categoryId && f.isPopular)
              .toList();

      final result = await repository.fetchPopularFoodsList(food.categoryId);
      expect(result, expected);
    });

    test('watchPopularFoodsList emits popular foods by categoryId', () {
      final food = testFoods.first;
      final expected =
          testFoods
              .where((f) => f.categoryId == food.categoryId && f.isPopular)
              .toList();

      expect(
        repository.watchPopularFoodsList(food.categoryId),
        emits(expected),
      );
    });
  });

  group('Subcategory Food List', () {
    test('fetchFoodsListSubCategoryId returns matching foods', () async {
      final food = testFoods.first;
      final expected =
          testFoods
              .where(
                (f) =>
                    f.categoryId == food.categoryId &&
                    f.subCategoryId == food.subCategoryId,
              )
              .toList();

      final result = await repository.fetchFoodsListSubCategoryId(
        food.categoryId,
        food.subCategoryId,
      );
      expect(result, expected);
    });

    test('watchFoodsListBySubCategoryId emits matching foods', () {
      final food = testFoods.first;
      final expected =
          testFoods
              .where(
                (f) =>
                    f.categoryId == food.categoryId &&
                    f.subCategoryId == food.subCategoryId,
              )
              .toList();

      expect(
        repository.watchFoodsListBySubCategoryId(
          food.categoryId,
          food.subCategoryId,
        ),
        emits(expected),
      );
    });
  });

  group('Popular Subcategory Food List', () {
    test(
      'fetchPopularFoodsListSubCategoryId returns matching popular foods',
      () async {
        final food = testFoods.first;
        final expected =
            testFoods
                .where(
                  (f) =>
                      f.categoryId == food.categoryId &&
                      f.subCategoryId == food.subCategoryId &&
                      f.isPopular,
                )
                .toList();

        final result = await repository.fetchPopularFoodsListSubCategoryId(
          food.categoryId,
          food.subCategoryId,
        );
        expect(result, expected);
      },
    );

    test('watchPopularFoodsListSubCategoryId emits matching popular foods', () {
      final food = testFoods.first;
      final expected =
          testFoods
              .where(
                (f) =>
                    f.categoryId == food.categoryId &&
                    f.subCategoryId == food.subCategoryId &&
                    f.isPopular,
              )
              .toList();

      expect(
        repository.watchPopularFoodsListSubCategoryId(
          food.categoryId,
          food.subCategoryId,
        ),
        emits(expected),
      );
    });
  });

  group('Single Food', () {
    test('fetchFood returns food by id and categoryId', () async {
      final food = testFoods.first;
      final result = await repository.fetchFood(food.categoryId, food.id);
      expect(result, food);
    });

    test('watchFood emits food by id and categoryId', () {
      final food = testFoods.first;
      expect(repository.watchFood(food.categoryId, food.id), emits(food));
    });
  });
}
