/*
import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home/domain/categories/entity.dart'; // Assuming EntityStatus is here
import 'package:app/src/features/home_detail/data/fake/test_residence_details.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FakeResidenceDetailsRepository implements ResidenceDetailsRepository {
  FakeResidenceDetailsRepository({this.addDelay = true});
  final bool addDelay;

  /// Use a copy of the test data so we don't modify the original list.
  final _residences = InMemoryStore<List<EntityDetail>>(
    List.from(testResidencesDetails),
  );

  // A helper to simulate network delay
  Future<void> _delay() => delay(addDelay);

  /// A helper function to safely get the primary ID from any EntityDetail type.
  EntityId _getId(EntityDetail entity) {
    // NOTE: The parameter count must match your actual EntityDetail.freezed.dart `when` method.
    // Based on your code, I am assuming 9 parameters for residence and 7 for food.
    return entity.when(
      residence: (residenceEntity, _, _, _, _, _, _, _, _) =>
          residenceEntity.id,
      food: (foodEntity, _, _, _, _, _, _) => foodEntity.id,
    );
  }

  /// A helper to get the ownerId.
  /// This assumes 'ownerId' is the second parameter in your EntityDetail's `when` signature.
  UserId _getOwnerId(EntityDetail entity) {
    return entity.when(
      residence: (_, ownerId, _, _, _, _, _, _, _) => ownerId,
      food: (_, ownerId, _, _, _, _, _) => ownerId,
    );
  }

  @override
  Future<void> setResidenceDetail(EntityDetail updated) async {
    await _delay();
    final residences = List<EntityDetail>.from(
      _residences.value,
    ); // Create a mutable copy
    final idToUpdate = _getId(updated);
    final index = residences.indexWhere(
      (entity) => _getId(entity) == idToUpdate,
    );

    if (index != -1) {
      // If found, replace it
      residences[index] = updated;
    } else {
      // If not found, add it
      residences.add(updated);
    }
    // Update the stream with the new list
    _residences.value = residences;
  }

  @override
  Future<void> updateResidenceStatus(EntityId id, EntityStatus status) async {
    await _delay();
    final residences = List<EntityDetail>.from(_residences.value);
    final index = residences.indexWhere((entity) => _getId(entity) == id);

    if (index != -1) {
      final oldDetail = residences[index];
      // Use `map` to safely update the inner frozen object
      final newDetail = oldDetail.map(
        residence: (residenceDetail) => residenceDetail.copyWith(
          residence: residenceDetail.residence.copyWith(entityStatus: status),
        ),
        food: (foodDetail) => foodDetail.copyWith(
          food: foodDetail.food.copyWith(entityStatus: status),
        ),
      );
      residences[index] = newDetail;
      _residences.value = residences;
    }
  }

  @override
  Stream<EntityDetail?> watchResidenceDetails(EntityId id) {
    return _residences.stream.map(
      (residences) =>
          residences.firstWhereOrNull((detail) => _getId(detail) == id),
    );
  }

  @override
  Future<EntityDetail?> fetchResidenceDetails(EntityId id) async {
    await _delay();
    return _residences.value.firstWhereOrNull((detail) => _getId(detail) == id);
  }

  @override
  Stream<EntityDetail?> watchResidenceDetailsByOwnerId(UserId id) {
    return _residences.stream.map(
      (residences) =>
          residences.firstWhereOrNull((detail) => _getOwnerId(detail) == id),
    );
  }

  @override
  Future<EntityDetail?> fetchResidenceDetailsByOwnerId(UserId id) async {
    await _delay();
    return _residences.value.firstWhereOrNull(
      (detail) => _getOwnerId(detail) == id,
    );
  }

  @override
  DocumentReference getNewResidenceDocRef() {
    // Faking a DocumentReference is complex. It's often best to throw an error
    // for simple fakes to indicate this functionality is not supported.
    throw UnimplementedError(
      'getNewResidenceDocRef is not mockable in this fake repository.',
    );
  }
}
*/