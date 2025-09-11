import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home_detail/data/fake/test_residence_details.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:uuid/uuid.dart';

class FakeResidenceDetailsRepository implements ResidenceDetailsRepository {
  FakeResidenceDetailsRepository({this.addDelay = true});
  final bool addDelay;

  final _residences = InMemoryStore<List<ResidenceDetail>>(
    List.from(testResidenceDetails),
  );
  final Uuid _uuid = const Uuid(); // Initialize Uuid

  @override
  Future<void> setResidenceDetail(ResidenceDetail updated) async {
    await delay(addDelay);
    _residences.value = [
      for (final residence in _residences.value)
        if (residence.id == updated.id) updated else residence,
    ];
  }

  @override
  Future<void> deleteResidenceDetail(EntityId id) async {
    await delay(addDelay);
    _residences.value = [
      for (final residence in _residences.value)
        if (residence.id != id) residence,
    ];
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
  Future<void> updateResidenceAvailability(
    EntityId id,
    bool status,
  ) async {
    await delay(addDelay);
    final current = _residences.value;
    final index = current.indexWhere((r) => r.id == id);
    if (index != -1) {
      final oldResidence = current[index];
      current[index] = oldResidence.copyWith(isRoomAvailable: status);
      _residences.value = [...current];
    }
  }

  @override
  String getNewResidenceDocRef() {
    // Changed return type to String
    return _uuid.v4(); // Return the generated ID directly
  }
}
