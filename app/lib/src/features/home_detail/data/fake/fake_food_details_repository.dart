import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home_detail/data/fake/test_food_details.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/domain/food_detail.dart';

class FakeFoodDetailsRepository implements FoodDetailsRepository {
  FakeFoodDetailsRepository({this.addDelay = true});
  final bool addDelay;

  final _foods = InMemoryStore<List<FoodDetail>>(List.from(testFoodDetails));

  @override
  Future<FoodDetail?> fetchFoodDetails(
    CategoryId categoryId,
    EntityId id,
  ) async {
    await delay(addDelay);
    final foods = _foods.value;
    return foods.firstWhereOrNull(
      (food) => food.id == id && food.categoryId == categoryId,
    );
  }

  @override
  Stream<FoodDetail?> watchFoodDetails(
    CategoryId categoryId,
    EntityId id,
  ) async* {
    await delay(addDelay);
    yield* _foods.stream.map(
      (foods) => foods.firstWhereOrNull(
        (food) => food.id == id && food.categoryId == categoryId,
      ),
    );
  }
}
