import 'dart:async';

import 'package:app/src/core/constants/test_residences.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/domain/entity_extensions.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';

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
  Future<List<Residence>> fetchResidencesList({
    required int limit,
    required ResidenceFilter filter,
    String? lastEntityId,
  }) async {
    await delay(addDelay);
    List<Residence> filteredResidences = _applyResidenceFilter(
      _residences.value,
      filter,
    );

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
        .where((f) => f.subCategoryId == subId)
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

    if (filter.isOpen) {
      result = result.where((residence) => residence.isEntityOpen()).toList();
    }
    if (filter.isFurnished) {
      result = result.where((residence) => residence.isFurnished).toList();
    }
    if (filter.genderPref != GenderPreference.any) {
      result = result
          .where((residence) => residence.genderPref == filter.genderPref)
          .toList();
    }
    if (filter.ratingSort != SortOrder.none) {
      result.sort((a, b) {
        if (filter.ratingSort == SortOrder.highToLow) {
          return b.avgRating.compareTo(a.avgRating);
        } else if (filter.ratingSort == SortOrder.lowToHigh) {
          return a.avgRating.compareTo(b.avgRating);
        }
        return 0;
      });
    }
    if (filter.priceSort != SortOrder.none) {
      result.sort((a, b) {
        if (filter.priceSort == SortOrder.highToLow) {
          return b.pricing.compareTo(a.pricing);
        } else if (filter.priceSort == SortOrder.lowToHigh) {
          return a.pricing.compareTo(b.pricing);
        }
        return 0;
      });
    }
    return result;
  }
}
