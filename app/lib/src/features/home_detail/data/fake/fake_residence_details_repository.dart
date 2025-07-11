import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home_detail/data/fake/test_residence_details.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FakeResidenceDetailsRepository implements ResidenceDetailsRepository {
  FakeResidenceDetailsRepository({this.addDelay = true});
  final bool addDelay;

  final _residences = InMemoryStore<List<ResidenceDetail>>(
    List.from(testResidenceDetails),
  );

  @override
  Future<void> setResidenceDetail(ResidenceDetail updated) async {
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
    return residences.firstWhereOrNull((residence) => residence.id == id);
  }

  @override
  Stream<ResidenceDetail?> watchResidenceDetails(EntityId id) async* {
    await delay(addDelay);
    yield* _residences.stream.map(
      (residences) =>
          residences.firstWhereOrNull((residence) => residence.id == id),
    );
  }

  @override
  Future<ResidenceDetail?> fetchResidenceDetailsByOwnerId(UserId id) {
    // TODO: implement fetchResidenceDetailsByOwnerId
    throw UnimplementedError();
  }

  @override
  DocumentReference<Object?> getNewResidenceDocRef() {
    // TODO: implement getNewResidenceDocRef
    throw UnimplementedError();
  }

  @override
  Stream<ResidenceDetail?> watchResidenceDetailsByOwnerId(UserId id) {
    // TODO: implement watchResidenceDetailsByOwnerId
    throw UnimplementedError();
  }
}
