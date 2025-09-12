import 'dart:async';

import 'package:app/src/core/constants/test_residences.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';

class FakeResidenceRepository implements ResidenceRepository {
  FakeResidenceRepository({
    this.addDelay = true,
    List<Residence>? initialResidences,
  }) : _residences = InMemoryStore<List<Residence>>(
         List.from(initialResidences ?? testResidences),
       );

  final bool addDelay;

  final InMemoryStore<List<Residence>> _residences;

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
  Future<List<Residence>> fetchResidencesList({
    required int limit,
    required ResidenceFilter filter,
    String? lastEntityId,
  }) async {
    await delay(addDelay);
    List<Residence> filteredResidences = _residences.value
        .where((r) => r.isPopular == false)
        .toList();
    filteredResidences = _applyResidenceFilter(filteredResidences, filter);

    int startIndex = 0;
    if (lastEntityId != null) {
      final lastIndex = filteredResidences.indexWhere(
        (f) => f.id == lastEntityId,
      );
      if (lastIndex != -1) {
        startIndex = lastIndex + 1;
      }
    }

    return filteredResidences.skip(startIndex).take(limit).toList();
  }

  @override
  Future<List<Residence>> fetchResidencesListBySubCategoryId(
    SubCategoryId subId, {
    required int limit,
    required ResidenceFilter filter,
    String? lastEntityId,
  }) async {
    await delay(addDelay);
    List<Residence> filteredResidences = _residences.value
        .where((f) => f.subCategoryId == subId && f.isPopular == false)
        .toList();
    filteredResidences = _applyResidenceFilter(filteredResidences, filter);

    int startIndex = 0;
    if (lastEntityId != null) {
      final lastIndex = filteredResidences.indexWhere(
        (f) => f.id == lastEntityId,
      );
      if (lastIndex != -1) {
        startIndex = lastIndex + 1;
      }
    }

    return filteredResidences.skip(startIndex).take(limit).toList();
  }

  @override
  Future<List<Residence>> fetchPopularResidencesList({
    required int limit,
    required ResidenceFilter filter,
    String? lastEntityId,
  }) async {
    await delay(addDelay);
    List<Residence> filteredResidences = _residences.value
        .where((r) => r.isPopular == true)
        .toList();
    filteredResidences = _applyResidenceFilter(filteredResidences, filter);

    int startIndex = 0;
    if (lastEntityId != null) {
      final lastIndex = filteredResidences.indexWhere(
        (r) => r.id == lastEntityId,
      );
      if (lastIndex != -1) {
        startIndex = lastIndex + 1;
      }
    }

    return filteredResidences.skip(startIndex).take(limit).toList();
  }

  @override
  Future<List<Residence>> fetchPopularResidencesListBySubCategoryId(
    SubCategoryId subCategoryId, {
    required int limit,
    required ResidenceFilter filter,
    String? lastEntityId,
  }) async {
    await delay(addDelay);
    List<Residence> filteredResidences = _residences.value
        .where((r) => r.isPopular == true && r.subCategoryId == subCategoryId)
        .toList();
    filteredResidences = _applyResidenceFilter(filteredResidences, filter);

    int startIndex = 0;
    if (lastEntityId != null) {
      final lastIndex = filteredResidences.indexWhere(
        (r) => r.id == lastEntityId,
      );
      if (lastIndex != -1) {
        startIndex = lastIndex + 1;
      }
    }

    return filteredResidences.skip(startIndex).take(limit).toList();
  }

  List<Residence> _applyResidenceFilter(
    List<Residence> residences,
    ResidenceFilter filter,
  ) {
    List<Residence> result = List.from(residences);

    if (filter.isRoomAvailable) {
      result = result.where((residence) => residence.isRoomAvailable).toList();
    }
    if (filter.isFurnished) {
      result = result.where((residence) => residence.isFurnished).toList();
    }
    if (filter.genderPref != null) {
      result = result
          .where((residence) => residence.genderPreference == filter.genderPref)
          .toList();
    }

    result.sort((a, b) {
      final comparison = switch (filter.sortBy) {
        SortBy.rating => a.avgRating.compareTo(b.avgRating),
        SortBy.price => a.pricing.cost.compareTo(b.pricing.cost),
        SortBy.updatedAt => a.updatedAt.compareTo(b.updatedAt),
      };
      return filter.sortOrder == SortOrder.highToLow ? -comparison : comparison;
    });

    return result;
  }
}
