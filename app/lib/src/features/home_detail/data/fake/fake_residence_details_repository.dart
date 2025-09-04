import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home_detail/data/fake/test_residence_details.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FakeResidenceDetailsRepository implements ResidenceDetailsRepository {
  FakeResidenceDetailsRepository({this.addDelay = true});
  final bool addDelay;

  final _residences = InMemoryStore<List<ResidenceDetail>>(
    List.from(testResidenceDetails),
  );

  @override
  Future<void> setResidenceDetail(ResidenceDetail updated) async {
    await delay(addDelay);
    final current = _residences.value;
    final index = current.indexWhere((r) => r.id == updated.id);
    if (index != -1) {
      current[index] = updated;
    } else {
      current.add(updated);
    }
    _residences.value = [...current];
  }

  @override
  Future<ResidenceDetail?> fetchResidenceDetails(EntityId id) async {
    await delay(addDelay);
    final residences = _residences.value;
    try {
      return residences.firstWhere((residence) => residence.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Stream<ResidenceDetail?> watchResidenceDetailsByOwnerId(UserId id) {
    return _residences.stream.map((residences) {
      try {
        return residences.firstWhere((residence) => residence.ownerId == id);
      } catch (e) {
        return null;
      }
    });
  }

  @override
  Future<ResidenceDetail?> fetchResidenceDetailsByOwnerId(UserId id) async {
    await delay(addDelay);
    return await watchResidenceDetailsByOwnerId(id).first;
  }

  @override
  Future<void> updateResidenceStatus(
    EntityId id,
    OperationalStatus status,
  ) async {
    await delay(addDelay);
    final current = _residences.value;
    final index = current.indexWhere((r) => r.id == id);
    if (index != -1) {
      final oldResidence = current[index];
      current[index] = oldResidence.copyWith(operationalStatus: status);
      _residences.value = [...current];
    }
  }

  @override
  DocumentReference<Object?> getNewResidenceDocRef() {
    // In a fake repository, we don't need a real DocumentReference.
    // The ID is typically generated on the client side for fake data.
    throw UnimplementedError(
      'getNewResidenceDocRef is not implemented in the fake repository',
    );
  }
}
