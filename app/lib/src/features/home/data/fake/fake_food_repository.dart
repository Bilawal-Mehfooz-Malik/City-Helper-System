import 'dart:async';
import 'package:app/src/core/constants/test_food_list.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home/domain/categories/food.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';

class FakeFoodRepository implements FoodRepository {
  FakeFoodRepository({this.addDelay = true});
  final bool addDelay;

  final _foods = InMemoryStore<List<Food>>(List.from(testFoods));

  @override
  Future<void> setFood(Food food) async {
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
  Stream<List<Food>> watchFoodsList() async* {
    await delay(addDelay);
    yield* _foods.stream;
  }

  @override
  Future<List<Food>> fetchFoodsList() async {
    await delay(addDelay);
    return _foods.value;
  }

  @override
  Stream<List<Food>> watchPopularFoodsList() async* {
    await delay(addDelay);
    yield* _foods.stream.map(
      (foods) => foods.where((f) => f.isPopular).toList(),
    );
  }

  @override
  Future<List<Food>> fetchPopularFoodsList() async {
    await delay(addDelay);
    return _foods.value.where((f) => f.isPopular).toList();
  }

  @override
  Stream<List<Food>> watchFoodsListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async* {
    await delay(addDelay);
    yield* _foods.stream.map(
      (foods) => foods.where((f) => f.subCategoryId == subCategoryId).toList(),
    );
  }

  @override
  Future<List<Food>> fetchFoodsListSubCategoryId(
    SubCategoryId subCategoryId,
  ) async {
    await delay(addDelay);
    return _foods.value.where((f) => f.subCategoryId == subCategoryId).toList();
  }

  @override
  Stream<List<Food>> watchPopularFoodsListSubCategoryId(
    SubCategoryId subCategoryId,
  ) async* {
    await delay(addDelay);
    yield* _foods.stream.map(
      (foods) => foods
          .where((f) => f.subCategoryId == subCategoryId && f.isPopular)
          .toList(),
    );
  }

  @override
  Future<List<Food>> fetchPopularFoodsListSubCategoryId(
    SubCategoryId subCategoryId,
  ) async {
    await delay(addDelay);
    return _foods.value
        .where((f) => f.subCategoryId == subCategoryId && f.isPopular)
        .toList();
  }

  @override
  Stream<Food?> watchFood(EntityId id) async* {
    await delay(addDelay);
    yield* _foods.stream.map((foods) {
      try {
        return foods.firstWhere((f) => f.id == id);
      } catch (_) {
        return null;
      }
    });
  }

  @override
  Future<Food?> fetchFood(EntityId id) async {
    await delay(addDelay);
    try {
      return _foods.value.firstWhere((f) => f.id == id);
    } catch (_) {
      return null;
    }
  }
}
