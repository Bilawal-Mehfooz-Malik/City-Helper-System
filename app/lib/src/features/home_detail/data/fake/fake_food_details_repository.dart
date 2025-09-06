import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home_detail/data/fake/test_food_details.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:uuid/uuid.dart';

class FakeFoodDetailsRepository implements FoodDetailsRepository {
  FakeFoodDetailsRepository({this.addDelay = true});
  final bool addDelay;

  final _foods = InMemoryStore<List<FoodDetail>>(List.from(testFoodDetails));
  final Uuid _uuid = const Uuid(); // Initialize Uuid

  @override
  Future<void> setFoodDetail(FoodDetail updated) async {
    await delay(addDelay);
    final current = _foods.value;
    final index = current.indexWhere((f) => f.id == updated.id);
    if (index != -1) {
      current[index] = updated;
    } else {
      current.add(updated);
    }
    _foods.value = [...current];
  }

  @override
  Future<FoodDetail?> fetchFoodDetails(EntityId id) async {
    await delay(addDelay);
    final foods = _foods.value;
    try {
      return foods.firstWhere((food) => food.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Stream<FoodDetail?> watchFoodDetailsByOwnerId(UserId id) {
    return _foods.stream.map((foods) {
      try {
        return foods.firstWhere((food) => food.ownerId == id);
      } catch (e) {
        return null;
      }
    });
  }

  @override
  Future<FoodDetail?> fetchFoodDetailsByOwnerId(UserId id) async {
    await delay(addDelay);
    return await watchFoodDetailsByOwnerId(id).first;
  }

  @override
  Future<void> updateFoodStatus(EntityId id, OperationalStatus status) async {
    await delay(addDelay);
    final current = _foods.value;
    final index = current.indexWhere((f) => f.id == id);
    if (index != -1) {
      final oldFood = current[index];
      current[index] = (oldFood).copyWith(operationalStatus: status);
      _foods.value = [...current];
    }
  }

  @override
  String getNewFoodsDocRef() {
    // Changed return type to String
    return _uuid.v4(); // Return the generated ID directly
  }
}
