import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/features/home/data/fake/fake_food_repository.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';
import 'package:app/src/core/constants/test_food_list.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';

void main() {
  late FoodRepository repository;

  setUp(() {
    repository = FakeFoodRepository(addDelay: false);
  });

  group('General Food List', () {
    test('fetchFoodsList returns foods by categoryId', () async {
      final food = testFoods.first;
      final expected = testFoods
          .where((f) => f.categoryId == food.categoryId && !f.isPopular)
          .toList();

      final result = await repository.fetchFoodsList(
        limit: expected.length,
        filter: const FoodFilter(),
      );
      expect(result, expected);
    });

    test('fetchFoodsList filters by isOpen', () async {
      final food = testFoods.first;
      final expected = testFoods
          .where(
            (f) => f.categoryId == food.categoryId && f.isOpen == true && !f.isPopular,
          )
          .toList();

      final result = await repository.fetchFoodsList(
        limit: expected.length,
        filter: const FoodFilter(isOpen: true),
      );
      expect(result, expected);
    });

    // watchFoodsList is not directly exposed by FoodRepository, so no test needed
  });

  group('Popular Food List', () {
    test('fetchPopularFoodsList returns popular foods by categoryId', () async {
      final food = testFoods.first;
      final expected = testFoods
          .where((f) => f.categoryId == food.categoryId && f.isPopular)
          .toList();

      final result = await repository.fetchPopularFoodsList(
        limit: expected.length,
        filter: const FoodFilter(),
      );
      expect(result, expected);
    });

    test('fetchPopularFoodsList filters by isOpen', () async {
      final food = testFoods.first;
      final expected = testFoods
          .where(
            (f) => f.categoryId == food.categoryId && f.isPopular && f.isOpen == true,
          )
          .toList();

      final result = await repository.fetchPopularFoodsList(
        limit: expected.length,
        filter: const FoodFilter(isOpen: true),
      );
      expect(result, expected);
    });
  });

  group('Subcategory Food List', () {
    test('fetchFoodsListSubCategoryId returns matching foods', () async {
      final food = testFoods.first;
      final expected = testFoods
          .where(
            (f) =>
                f.categoryId == food.categoryId &&
                f.subCategoryId == food.subCategoryId &&
                !f.isPopular,
          )
          .toList();

      final result = await repository.fetchFoodsListSubCategoryId(
        food.subCategoryId,
        limit: expected.length,
        filter: const FoodFilter(),
      );
      expect(result, expected);
    });

    test('fetchFoodsListSubCategoryId filters by isOpen', () async {
      final food = testFoods.first;
      final expected = testFoods
          .where(
            (f) =>
                f.categoryId == food.categoryId &&
                f.subCategoryId == food.subCategoryId &&
                f.isOpen == true &&
                !f.isPopular,
          )
          .toList();

      final result = await repository.fetchFoodsListSubCategoryId(
        food.subCategoryId,
        limit: expected.length,
        filter: const FoodFilter(isOpen: true),
      );
      expect(result, expected);
    });
  });

  group('Popular Subcategory Food List', () {
    test(
      'fetchPopularFoodsListSubCategoryId returns matching popular foods',
      () async {
        final food = testFoods.first;
        final expected = testFoods
            .where(
              (f) =>
                  f.categoryId == food.categoryId &&
                  f.subCategoryId == food.subCategoryId &&
                  f.isPopular,
            )
            .toList();

        final result = await repository.fetchPopularFoodsListSubCategoryId(
          food.subCategoryId,
          limit: expected.length,
          filter: const FoodFilter(),
        );
        expect(result, expected);
      },
    );

    test('fetchPopularFoodsListSubCategoryId filters by isOpen', () async {
      final food = testFoods.first;
      final expected = testFoods
          .where(
            (f) =>
                f.categoryId == food.categoryId &&
                f.subCategoryId == food.subCategoryId &&
                f.isPopular &&
                f.isOpen == true,
          )
          .toList();

      final result = await repository.fetchPopularFoodsListSubCategoryId(
        food.subCategoryId,
        limit: expected.length,
        filter: const FoodFilter(isOpen: true),
      );
      expect(result, expected);
    });
  });

  group('Single Food', () {
    test('fetchFood returns food by id and categoryId', () async {
      final food = testFoods.first;
      final result = await repository.fetchFood(food.id);
      expect(result, food);
    });

    test('watchFood emits food by id and categoryId', () {
      final food = testFoods.first;
      expect(repository.watchFood(food.id), emits(food));
    });
  });

  group('setFood', () {
    test('adds new food if id does not exist', () async {
      final newFood = testFoods.first.copyWith(id: 'new-food-id');
      await repository.setFood(newFood);
      final result = await repository.fetchFood(newFood.id);
      expect(result, newFood);
    });

    test('updates existing food if id exists', () async {
      final existingFood = testFoods.first;
      final updatedFood = existingFood.copyWith(name: 'Updated Name');
      await repository.setFood(updatedFood);
      final result = await repository.fetchFood(existingFood.id);
      expect(result, updatedFood);
    });
  });
}