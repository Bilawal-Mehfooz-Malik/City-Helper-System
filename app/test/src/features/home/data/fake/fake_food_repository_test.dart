import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/features/home/data/fake/fake_food_repository.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';
import 'package:app/src/core/constants/test_food_list.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';

void main() {
  late FoodRepository repository;

  setUp(() {
    repository = FakeFoodRepository(addDelay: false, initialFoods: testFoods);
  });

  group('General Food List', () {
    test('fetchFoodsList returns foods by categoryId', () async {
      final food = testFoods.first;
      final expected =
          testFoods
              .where((f) => f.categoryId == food.categoryId && !f.isPopular)
              .toList()
            ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

      final result = await repository.fetchFoodsList(
        limit: expected.length,
        filter: const FoodFilter(),
      );
      expect(result, expected);
    });
  });

  group('Popular Food List', () {
    test('fetchPopularFoodsList returns popular foods by categoryId', () async {
      final food = testFoods.first;
      final expected =
          testFoods
              .where((f) => f.categoryId == food.categoryId && f.isPopular)
              .toList()
            ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

      final result = await repository.fetchPopularFoodsList(
        limit: expected.length,
        filter: const FoodFilter(),
      );
      expect(result, expected);
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
                    f.subCategoryId == food.subCategoryId &&
                    !f.isPopular,
              )
              .toList()
            ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

      final result = await repository.fetchFoodsListSubCategoryId(
        food.subCategoryId,
        limit: expected.length,
        filter: const FoodFilter(),
      );
      expect(result, expected);
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
                .toList()
              ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

        final result = await repository.fetchPopularFoodsListSubCategoryId(
          food.subCategoryId,
          limit: expected.length,
          filter: const FoodFilter(),
        );
        expect(result, expected);
      },
    );
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

  group('Sorting', () {
    test('fetchFoodsList sorts by updatedAt descending by default', () async {
      final foodA = testFoods[0].copyWith(
        id: 'foodA',
        updatedAt: DateTime(2023, 1, 1),
        isPopular: false,
      );
      final foodB = testFoods[1].copyWith(
        id: 'foodB',
        updatedAt: DateTime(2023, 1, 2),
        isPopular: false,
      );
      final foodC = testFoods[2].copyWith(
        id: 'foodC',
        updatedAt: DateTime(2023, 1, 3),
        isPopular: false,
      );

      final testRepository = FakeFoodRepository(
        addDelay: false,
        initialFoods: [foodA, foodB, foodC],
      );

      final result = await testRepository.fetchFoodsList(
        limit: 3,
        filter: const FoodFilter(),
      );

      expect(result[0].id, foodC.id);
      expect(result[1].id, foodB.id);
      expect(result[2].id, foodA.id);
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
