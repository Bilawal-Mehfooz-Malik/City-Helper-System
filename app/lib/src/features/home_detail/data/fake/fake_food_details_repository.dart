/*
import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home/domain/categories/entity.dart'; // Assuming EntityStatus is here
import 'package:app/src/features/home_detail/data/fake/test_food_details.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FakeFoodDetailsRepository implements FoodDetailsRepository {
  FakeFoodDetailsRepository({this.addDelay = true});
  final bool addDelay;

  /// Use a copy of the test data so we don't modify the original list.
  final _foods = InMemoryStore<List<EntityDetail>>(List.from(testFoodDetails));

  // A helper to simulate network delay
  Future<void> _delay() => delay(addDelay);

  /// A helper function to safely get the primary ID from any EntityDetail type.
  /// This avoids repeating the same `when` clause everywhere.
  EntityId _getId(EntityDetail entity) {
    // NOTE: The parameter count in `when` (13 in this case) must match your actual
    // EntityDetail.freezed.dart generated `when` method signature.
    return entity.when(
      food: (foodEntity, _, _, _, _, _, _, _, _, _, _, _, _) => foodEntity.id,
      residence: (residenceEntity, _, _, _, _, _, _, _, _, _, _, _, _) =>
          residenceEntity.id,
    );
  }

  /// A helper to get the ownerId.
  /// This assumes 'ownerId' is the second parameter in your EntityDetail's `when` signature.
  UserId _getOwnerId(EntityDetail entity) {
    return entity.when(
      food: (_, ownerId, _, _, _, _, _, _, _, _, _, _, _) => ownerId,
      residence: (_, ownerId, _, _, _, _, _, _, _, _, _, _, _) => ownerId,
    );
  }

  @override
  Future<void> setFoodDetail(EntityDetail updated) async {
    await _delay();
    final foods = List<EntityDetail>.from(
      _foods.value,
    ); // Create a mutable copy
    final idToUpdate = _getId(updated);
    final index = foods.indexWhere((entity) => _getId(entity) == idToUpdate);

    if (index != -1) {
      // If found, replace it
      foods[index] = updated;
    } else {
      // If not found, add it
      foods.add(updated);
    }
    // Update the stream with the new list
    _foods.value = foods;
  }

  @override
  Future<void> updateFoodStatus(EntityId id, EntityStatus status) async {
    await _delay();
    final foods = List<EntityDetail>.from(_foods.value);
    final index = foods.indexWhere((entity) => _getId(entity) == id);

    if (index != -1) {
      final oldDetail = foods[index];
      // Use the `map` method to access the inner object and `copyWith` to update it.
      // This assumes your `EntityDetail` and `Entity` classes are sealed/frozen.
      final newDetail = oldDetail.map(
        food: (foodDetail) => foodDetail.copyWith(
          // Assuming the base Entity object is the first item in the detail object
          food: foodDetail.food.copyWith(entityStatus: status),
        ),
        residence: (residenceDetail) => residenceDetail.copyWith(
          // Assuming the base Entity object is the first item in the detail object
          residence: residenceDetail.residence.copyWith(entityStatus: status),
        ),
      );
      foods[index] = newDetail;
      _foods.value = foods;
    }
  }

  @override
  Stream<EntityDetail?> watchFoodDetails(EntityId id) {
    return _foods.stream.map(
      (foods) => foods.firstWhereOrNull((detail) => _getId(detail) == id),
    );
  }

  @override
  Stream<EntityDetail?> watchFoodDetailsByOwnerId(UserId id) {
    return _foods.stream.map(
      (foods) => foods.firstWhereOrNull((detail) => _getOwnerId(detail) == id),
    );
  }

  @override
  Future<EntityDetail?> fetchFoodDetailsByOwnerId(UserId id) async {
    await _delay();
    return _foods.value.firstWhereOrNull((detail) => _getOwnerId(detail) == id);
  }

  @override
  DocumentReference getNewFoodsDocRef() {
    // Faking a DocumentReference is complex. It's often best to throw an error
    // for simple fakes to indicate this functionality is not supported.
    throw UnimplementedError(
      'getNewFoodsDocRef is not mockable in this fake repository.',
    );
  }

  @override
  Future<FoodDetail?> fetchFoodDetails(EntityId id) async {
    await _delay();
    final entityDetail = _foods.value.firstWhereOrNull(
      (detail) => _getId(detail) == id,
    );
    if (entityDetail is FoodDetail) {
      return entityDetail;
    }
    return null;
  }
}
*/