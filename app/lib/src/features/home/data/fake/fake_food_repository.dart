import 'dart:async';
import 'package:app/src/core/constants/test_food_list.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';

class FakeFoodRepository implements FoodRepository {
  FakeFoodRepository({this.addDelay = true, List<Food>? initialFoods})
    : _foods = InMemoryStore<List<Food>>(List.from(initialFoods ?? testFoods));
  final bool addDelay;

  final InMemoryStore<List<Food>> _foods;

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

  List<Food> _applyFoodFilter(List<Food> foods, FoodFilter filter) {
    List<Food> result = List.from(foods);

    if (filter.genderPref != null) {
      result = result
          .where((food) => food.genderPreference == filter.genderPref)
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
    } else {
      result.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    }
    return result;
  }
}
