import 'dart:async';
import 'package:app/src/core/constants/test_food_list.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';

class FakeFoodRepository implements FoodRepository {
  FakeFoodRepository({this.addDelay = true});
  final bool addDelay;

  final _foods = InMemoryStore<List<Entity>>(List.from(testFoods));

  @override
  Future<void> setFood(Entity food) async {
    final list = [..._foods.value];
    final index = list.indexWhere((f) => f.id == food.id);
    if (index != -1) {
      list[index] = food;
    } else {
      list.add(food);
    }
    _foods.value = list;
  }

  @override
  Stream<List<Entity>> watchFoodsList() async* {
    await delay(addDelay);
    yield* _foods.stream;
  }

  @override
  Future<List<Entity>> fetchFoodsList() async {
    await delay(addDelay);
    return _foods.value;
  }

  @override
  Stream<List<Entity>> watchPopularFoodsList() async* {
    await delay(addDelay);
    yield* _foods.stream.map(
      (foods) => foods.where((f) => f.mapOrNull(food: (food) => food.isPopular) ?? false).toList(),
    );
  }

  @override
  Future<List<Entity>> fetchPopularFoodsList() async {
    await delay(addDelay);
    return _foods.value.where((f) => f.mapOrNull(food: (food) => food.isPopular) ?? false).toList();
  }

  @override
  Stream<List<Entity>> watchFoodsListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async* {
    await delay(addDelay);
    yield* _foods.stream.map(
      (foods) => foods.where((f) => f.mapOrNull(food: (food) => food.subCategoryId == subCategoryId) ?? false).toList(),
    );
  }

  @override
  Future<List<Entity>> fetchFoodsListSubCategoryId(
    SubCategoryId subCategoryId,
  ) async {
    await delay(addDelay);
    return _foods.value.where((f) => f.mapOrNull(food: (food) => food.subCategoryId == subCategoryId) ?? false).toList();
  }

  @override
  Stream<List<Entity>> watchPopularFoodsListSubCategoryId(
    SubCategoryId subCategoryId,
  ) async* {
    await delay(addDelay);
    yield* _foods.stream.map(
      (foods) => foods
          .where((f) =>
              (f.mapOrNull(food: (food) => food.subCategoryId == subCategoryId) ?? false) &&
              (f.mapOrNull(food: (food) => food.isPopular) ?? false))
          .toList(),
    );
  }

  @override
  Future<List<Entity>> fetchPopularFoodsListSubCategoryId(
    SubCategoryId subCategoryId,
  ) async {
    await delay(addDelay);
    return _foods.value
        .where((f) =>
            (f.mapOrNull(food: (food) => food.subCategoryId == subCategoryId) ?? false) &&
            (f.mapOrNull(food: (food) => food.isPopular) ?? false))
        .toList();
  }

  @override
  Stream<Entity?> watchFood(EntityId id) async* {
    await delay(addDelay);
    yield* _foods.stream.map((foods) {
      try {
        return foods.firstWhere((f) => f.mapOrNull(food: (food) => food.id == id) ?? false);
      } catch (_) {
        return null;
      }
    });
  }

  @override
  Future<Entity?> fetchFood(EntityId id) async {
    await delay(addDelay);
    try {
      return _foods.value.firstWhere((f) => f.mapOrNull(food: (food) => food.id == id) ?? false);
    } catch (_) {
      return null;
    }
  }
}
