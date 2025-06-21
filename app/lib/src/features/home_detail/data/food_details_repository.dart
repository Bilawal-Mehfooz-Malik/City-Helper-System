import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/domain/food_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_details_repository.g.dart';

class FoodDetailsRepository {
  static String get foodsDetailsKey => 'food_details';

  Future<void> setFoodDetail(FoodDetail updated) async {
    throw UnimplementedError();
  }

  Stream<FoodDetail?> watchFoodDetails(CategoryId categoryId, EntityId id) {
    throw UnimplementedError();
  }

  Future<FoodDetail?> fetchFoodDetails(CategoryId categoryId, EntityId id) {
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
FoodDetailsRepository foodDetailsRepository(Ref ref) {
  return FoodDetailsRepository();
}
