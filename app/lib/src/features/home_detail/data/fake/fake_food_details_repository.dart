import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home_detail/data/fake/test_food_details.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FakeFoodDetailsRepository implements FoodDetailsRepository {
  FakeFoodDetailsRepository({this.addDelay = true});
  final bool addDelay;

  final _foods = InMemoryStore<List<FoodDetail>>(List.from(testFoodDetails));

  @override
  Future<void> setFoodDetail(FoodDetail updated) async {
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
    return foods.firstWhereOrNull((food) => food.id == id);
  }

  @override
  Future<FoodDetail?> fetchFoodDetailsByOwnerId(UserId id) {
    // TODO: implement fetchFoodDetailsByOwnerId
    throw UnimplementedError();
  }

  @override
  DocumentReference<Object?> getNewFoodsDocRef() {
    // TODO: implement getNewFoodsDocRef
    throw UnimplementedError();
  }

  @override
  Stream<FoodDetail?> watchFoodDetailsByOwnerId(UserId id) {
    // TODO: implement watchFoodDetailsByOwnerId
    throw UnimplementedError();
  }

  @override
  Future<void> updateFoodStatus(EntityId id, OperationalStatus status) {
    // TODO: implement updateFoodStatus
    throw UnimplementedError();
  }
}
