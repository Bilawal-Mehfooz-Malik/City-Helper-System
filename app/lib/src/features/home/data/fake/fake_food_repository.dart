import 'dart:async';
import 'package:app/src/core/constants/test_food_list.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';
import 'package:app/src/features/home/domain/categories/food.dart';

class FakeFoodRepository implements FoodRepository {
  FakeFoodRepository({this.addDelay = true});
  final bool addDelay;

  // Preload with a default list of foods
  final _foods = InMemoryStore<List<Food>>(List.from(testFoods));

  @override
  Stream<List<Food>> watchFoodsList(CategoryId categoryId) {
    return _filterFoodsList(categoryId);
  }

  @override
  Future<List<Food>> fetchFoodsList(CategoryId categoryId) async {
    await delay(addDelay);
    return _filterFoodsList(categoryId).first;
  }

  @override
  Stream<List<Food>> watchPopularFoodsList(CategoryId categoryId) {
    return _filterPopularFoodsList(categoryId);
  }

  @override
  Future<List<Food>> fetchPopularFoodsList(CategoryId categoryId) async {
    await delay(addDelay);
    return _filterPopularFoodsList(categoryId).first;
  }

  @override
  Future<List<Food>> fetchFoodsListSubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) async {
    await delay(addDelay);
    return _filterFoodsListBySubCategoryId(categoryId, subCategoryId).first;
  }

  @override
  Stream<List<Food>> watchFoodsListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    return _filterFoodsListBySubCategoryId(categoryId, subCategoryId);
  }

  @override
  Future<List<Food>> fetchPopularFoodsListSubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) async {
    await delay(addDelay);
    return _filterPopularFoodsListBySubCategoryId(
      categoryId,
      subCategoryId,
    ).first;
  }

  @override
  Stream<List<Food>> watchPopularFoodsListSubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    return _filterPopularFoodsListBySubCategoryId(categoryId, subCategoryId);
  }

  @override
  Future<Food?> fetchFood(CategoryId categoryId, EntityId id) async {
    await delay(addDelay);
    return Future.value(_filterFoodById(_foods.value, categoryId, id));
  }

  @override
  Stream<Food?> watchFood(CategoryId categoryId, EntityId id) {
    return _foods.stream.map((foods) => _filterFoodById(foods, categoryId, id));
  }

  // * Helper methods
  Stream<List<Food>> _filterFoodsList(CategoryId categoryId) {
    return _foods.stream.map(
      (foods) => foods.where((food) => food.categoryId == categoryId).toList(),
    );
  }

  Stream<List<Food>> _filterFoodsListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    return _foods.stream.map(
      (foods) =>
          foods
              .where(
                (food) =>
                    food.categoryId == categoryId &&
                    food.subCategoryId == subCategoryId,
              )
              .toList(),
    );
  }

  Stream<List<Food>> _filterPopularFoodsList(CategoryId categoryId) {
    return _foods.stream.map(
      (foods) =>
          foods
              .where((food) => food.categoryId == categoryId && food.isPopular)
              .toList(),
    );
  }

  Stream<List<Food>> _filterPopularFoodsListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    return _foods.stream.map(
      (foods) =>
          foods
              .where(
                (food) =>
                    food.categoryId == categoryId &&
                    food.isPopular &&
                    food.subCategoryId == subCategoryId,
              )
              .toList(),
    );
  }

  Food? _filterFoodById(List<Food> foods, CategoryId categoryId, EntityId id) {
    try {
      return foods.firstWhere(
        (food) => food.categoryId == categoryId && food.id == id,
      );
    } catch (e) {
      return null;
    }
  }
}
