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
  final _residences = InMemoryStore<List<Entity>>(List.from(testResidences));

  @override
  Future<void> setResidence(Entity residence) async {
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
  Stream<List<Entity>> watchResidencesList() async* {
    await delay(addDelay);
    yield* _residences.stream;
  }

  @override
  Future<List<Entity>> fetchResidencesList() async {
    await delay(addDelay);
    return _residences.value;
  }

  @override
  Stream<List<Entity>> watchPopularResidencesList() async* {
    await delay(addDelay);
    yield* _residences.stream.map(
      (residences) => residences
          .where((r) => r.mapOrNull(residence: (res) => res.isPopular) ?? false)
          .toList(),
    );
  }

  @override
  Future<List<Entity>> fetchPopularResidencesList() async {
    await delay(addDelay);
    return _residences.value
        .where((r) => r.mapOrNull(residence: (res) => res.isPopular) ?? false)
        .toList();
  }

  @override
  Stream<List<Entity>> watchResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async* {
    await delay(addDelay);
    yield* _residences.stream.map(
      (residences) => residences
          .where(
            (r) =>
                r.mapOrNull(
                  residence: (res) => res.subCategoryId == subCategoryId,
                ) ??
                false,
          )
          .toList(),
    );
  }

  @override
  Future<List<Entity>> fetchResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async {
    await delay(addDelay);
    return _residences.value
        .where(
          (r) =>
              r.mapOrNull(
                residence: (res) => res.subCategoryId == subCategoryId,
              ) ??
              false,
        )
        .toList();
  }

  @override
  Stream<List<Entity>> watchPopularResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async* {
    await delay(addDelay);
    yield* _residences.stream.map(
      (residences) => residences
          .where(
            (r) =>
                (r.mapOrNull(
                      residence: (res) => res.subCategoryId == subCategoryId,
                    ) ??
                    false) &&
                (r.mapOrNull(residence: (res) => res.isPopular) ?? false),
          )
          .toList(),
    );
  }

  @override
  Future<List<Entity>> fetchPopularResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async {
    await delay(addDelay);
    return _residences.value
        .where(
          (r) =>
              (r.mapOrNull(
                    residence: (res) => res.subCategoryId == subCategoryId,
                  ) ??
                  false) &&
              (r.mapOrNull(residence: (res) => res.isPopular) ?? false),
        )
        .toList();
  }

  @override
  Future<Entity?> fetchResidence(EntityId id) async {
    await delay(addDelay);
    try {
      return _residences.value.firstWhere(
        (r) => r.mapOrNull(residence: (res) => res.id == id) ?? false,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<Entity?> watchResidence(EntityId id) async* {
    await delay(addDelay);
    yield* _residences.stream.map((residences) {
      try {
        return residences.firstWhere(
          (r) => r.mapOrNull(residence: (res) => res.id == id) ?? false,
        );
      } catch (_) {
        return null;
      }
    });
  }
}
