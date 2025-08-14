import 'dart:async';

import 'package:app/src/core/constants/test_residences.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/domain/entity.dart';

class FakeResidenceRepository implements ResidenceRepository {
  FakeResidenceRepository({this.addDelay = true});

  final bool addDelay;

  // Preloaded list of fake residences
  final _residences = InMemoryStore<List<Residence>>(List.from(testResidences));

  @override
  Future<void> setResidence(Residence residence) async {
    final list = [..._residences.value];
    final index = list.indexWhere((r) => r.id == residence.id);
    if (index != -1) {
      list[index] = residence;
    } else {
      list.add(residence);
    }
    _residences.value = list;
  }

  @override
  Stream<List<Residence>> watchResidencesList() async* {
    await delay(addDelay);
    yield* _residences.stream;
  }

  @override
  Future<List<Residence>> fetchResidencesList() async {
    await delay(addDelay);
    return _residences.value;
  }

  @override
  Stream<List<Residence>> watchPopularResidencesList() async* {
    await delay(addDelay);
    yield* _residences.stream.map(
      (residences) => residences.where((r) => r.isPopular).toList(),
    );
  }

  @override
  Future<List<Residence>> fetchPopularResidencesList() async {
    await delay(addDelay);
    return _residences.value.where((r) => r.isPopular).toList();
  }

  @override
  Stream<List<Residence>> watchResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async* {
    await delay(addDelay);
    yield* _residences.stream.map(
      (residences) =>
          residences.where((r) => r.subCategoryId == subCategoryId).toList(),
    );
  }

  @override
  Future<List<Residence>> fetchResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async {
    await delay(addDelay);
    return _residences.value
        .where((r) => r.subCategoryId == subCategoryId)
        .toList();
  }

  @override
  Stream<List<Residence>> watchPopularResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async* {
    await delay(addDelay);
    yield* _residences.stream.map(
      (residences) => residences
          .where((r) => r.subCategoryId == subCategoryId && r.isPopular)
          .toList(),
    );
  }

  @override
  Future<List<Residence>> fetchPopularResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async {
    await delay(addDelay);
    return _residences.value
        .where((r) => r.subCategoryId == subCategoryId && r.isPopular)
        .toList();
  }

  @override
  Future<Residence?> fetchResidence(EntityId id) async {
    await delay(addDelay);
    try {
      return _residences.value.firstWhere((r) => r.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<Residence?> watchResidence(EntityId id) async* {
    await delay(addDelay);
    yield* _residences.stream.map((residences) {
      try {
        return residences.firstWhere((r) => r.id == id);
      } catch (_) {
        return null;
      }
    });
  }
}
