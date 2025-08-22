import 'dart:async';
import 'package:app/src/core/constants/test_food_list.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';

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
  Future<List<Food>> fetchFoodsList({
    required int limit,
    required FoodFilter filter,
    String? lastEntityId,
  }) async {
    await delay(addDelay);
    List<Food> filteredFoods = _foods.value
        .where((f) => f.isPopular == false)
        .toList();
    filteredFoods = _applyFoodFilter(filteredFoods, filter);

    int startIndex = 0;
    if (lastEntityId != null) {
      final lastIndex = filteredFoods.indexWhere((f) => f.id == lastEntityId);
      if (lastIndex != -1) {
        startIndex = lastIndex + 1;
      }
    }

    return filteredFoods.skip(startIndex).take(limit).toList();
  }

  @override
  Future<List<Food>> fetchFoodsListSubCategoryId(
    SubCategoryId subId, {
    required int limit,
    required FoodFilter filter,
    String? lastEntityId,
  }) async {
    await delay(addDelay);
    List<Food> filteredFoods = _foods.value
        .where((f) => f.subCategoryId == subId && f.isPopular == false)
        .toList();
    filteredFoods = _applyFoodFilter(filteredFoods, filter);

    int startIndex = 0;
    if (lastEntityId != null) {
      final lastIndex = filteredFoods.indexWhere((f) => f.id == lastEntityId);
      if (lastIndex != -1) {
        startIndex = lastIndex + 1;
      }
    }

    return filteredFoods.skip(startIndex).take(limit).toList();
  }

  @override
  Future<List<Food>> fetchPopularFoodsList({
    required int limit,
    required FoodFilter filter,
    String? lastEntityId,
  }) async {
    await delay(addDelay);
    List<Food> filteredFoods = _foods.value
        .where((f) => f.isPopular == true)
        .toList();
    filteredFoods = _applyFoodFilter(filteredFoods, filter);

    int startIndex = 0;
    if (lastEntityId != null) {
      final lastIndex = filteredFoods.indexWhere((f) => f.id == lastEntityId);
      if (lastIndex != -1) {
        startIndex = lastIndex + 1;
      }
    }

    return filteredFoods.skip(startIndex).take(limit).toList();
  }

  @override
  Future<List<Food>> fetchPopularFoodsListSubCategoryId(
    SubCategoryId subId, {
    required int limit,
    required FoodFilter filter,
    String? lastEntityId,
  }) async {
    await delay(addDelay);
    List<Food> filteredFoods = _foods.value
        .where((f) => f.isPopular == true && f.subCategoryId == subId)
        .toList();
    filteredFoods = _applyFoodFilter(filteredFoods, filter);

    int startIndex = 0;
    if (lastEntityId != null) {
      final lastIndex = filteredFoods.indexWhere((f) => f.id == lastEntityId);
      if (lastIndex != -1) {
        startIndex = lastIndex + 1;
      }
    }

    return filteredFoods.skip(startIndex).take(limit).toList();
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

  List<Food> _applyFoodFilter(List<Food> foods, FoodFilter filter) {
    List<Food> result = List.from(foods);

    if (filter.getIsOpen) {
      result = result.where((food) => food.isOpen == true).toList();
    }
    if (filter.genderPref != GenderPreference.any) {
      result = result
          .where((food) => food.genderPref == filter.genderPref)
          .toList();
    }
    if (filter.ratingSort != SortOrder.none) {
      result.sort((a, b) {
        if (filter.ratingSort == SortOrder.highToLow) {
          return b.avgRating.compareTo(a.avgRating);
        } else if (filter.ratingSort == SortOrder.lowToHigh) {
          return a.avgRating.compareTo(b.avgRating);
        }
        return 0;
      });
    }
    return result;
  }
}
