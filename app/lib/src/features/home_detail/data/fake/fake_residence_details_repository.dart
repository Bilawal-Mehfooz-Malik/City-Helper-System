import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home_detail/data/fake/test_residence_details.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';

class FakeResidenceDetailsRepository implements ResidenceDetailsRepository {
  FakeResidenceDetailsRepository({this.addDelay = true});
  final bool addDelay;

  final _residences = InMemoryStore<List<ResidenceDetail>>(
    List.from(testResidenceDetails),
  );

  @override
  Future<ResidenceDetail?> fetchResidenceDetails(
    CategoryId categoryId,
    EntityId id,
  ) async {
    await delay(addDelay);
    final residences = _residences.value;
    return residences.firstWhereOrNull(
      (residence) => residence.id == id && residence.categoryId == categoryId,
    );
  }

  @override
  Stream<ResidenceDetail?> watchResidenceDetails(
    CategoryId categoryId,
    EntityId id,
  ) async* {
    await delay(addDelay);
    yield* _residences.stream.map(
      (residences) => residences.firstWhereOrNull(
        (residence) => residence.id == id && residence.categoryId == categoryId,
      ),
    );
  }
}
