import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/categories/food.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_repository.g.dart';

class FoodRepository {
  static String get foodsKey => 'food';

  Future<void> setFood(Food food) async {
    throw UnimplementedError();
  }

  Stream<List<Food>> watchFoodsList(CategoryId categoryId) {
    throw UnimplementedError();
  }

  Stream<List<Food>> watchPopularFoodsList(CategoryId categoryId) {
    throw UnimplementedError();
  }

  Future<List<Food>> fetchFoodsList(CategoryId categoryId) {
    throw UnimplementedError();
  }

  Future<List<Food>> fetchPopularFoodsList(CategoryId categoryId) {
    throw UnimplementedError();
  }

  Stream<List<Food>> watchFoodsListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    throw UnimplementedError();
  }

  Stream<List<Food>> watchPopularFoodsListSubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    throw UnimplementedError();
  }

  Future<List<Food>> fetchFoodsListSubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    throw UnimplementedError();
  }

  Future<List<Food>> fetchPopularFoodsListSubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    throw UnimplementedError();
  }

  Future<Food?> fetchFood(CategoryId categoryId, EntityId id) async {
    throw UnimplementedError();
  }

  Stream<Food?> watchFood(CategoryId categoryId, EntityId id) {
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
FoodRepository foodRepository(Ref ref) {
  return FoodRepository();
}
