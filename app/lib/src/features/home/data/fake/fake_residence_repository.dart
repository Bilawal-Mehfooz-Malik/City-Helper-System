import 'dart:async';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/core/constants/test_residences.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/domain/categories/residence.dart';

class FakeResidenceRepository implements ResidenceRepository {
  FakeResidenceRepository({this.addDelay = true});
  final bool addDelay;

  // Preload with a default list of residences
  final _residences = InMemoryStore<List<Residence>>(List.from(testResidences));

  @override
  Stream<List<Residence>> watchResidencesList(CategoryId categoryId) {
    return _filterResidencesList(categoryId);
  }

  @override
  Future<List<Residence>> fetchResidencesList(CategoryId categoryId) async {
    await delay(addDelay);
    return _filterResidencesList(categoryId).first;
  }

  @override
  Stream<List<Residence>> watchPopularResidencesList(CategoryId categoryId) {
    return _filterPopularResidencesList(categoryId);
  }

  @override
  Future<List<Residence>> fetchPopularResidencesList(
    CategoryId categoryId,
  ) async {
    await delay(addDelay);
    return _filterPopularResidencesList(categoryId).first;
  }

  @override
  Future<List<Residence>> fetchResidencesListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) async {
    await delay(addDelay);
    return _filterResidencesListBySubCategoryId(
      categoryId,
      subCategoryId,
    ).first;
  }

  @override
  Stream<List<Residence>> watchResidencesListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    return _filterResidencesListBySubCategoryId(categoryId, subCategoryId);
  }

  @override
  Future<List<Residence>> fetchPopularResidencesListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) async {
    await delay(addDelay);
    return _filterPopularResidencesListBySubCategoryId(
      categoryId,
      subCategoryId,
    ).first;
  }

  @override
  Stream<List<Residence>> watchPopularResidencesListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    return _filterPopularResidencesListBySubCategoryId(
      categoryId,
      subCategoryId,
    );
  }

  @override
  Future<Residence?> fetchResidence(CategoryId categoryId, EntityId id) async {
    await delay(addDelay);
    return Future.value(
      _filterResidenceById(_residences.value, categoryId, id),
    );
  }

  @override
  Stream<Residence?> watchResidence(CategoryId categoryId, EntityId id) {
    return _residences.stream.map(
      (residences) => _filterResidenceById(residences, categoryId, id),
    );
  }

  // * Helper methods
  Stream<List<Residence>> _filterResidencesList(CategoryId categoryId) {
    return _residences.stream.map(
      (entities) =>
          entities.where((entity) => entity.categoryId == categoryId).toList(),
    );
  }

  // * Helper methods
  Stream<List<Residence>> _filterResidencesListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    return _residences.stream.map(
      (entities) =>
          entities
              .where(
                (entity) =>
                    entity.categoryId == categoryId &&
                    entity.subCategoryId == subCategoryId,
              )
              .toList(),
    );
  }

  Stream<List<Residence>> _filterPopularResidencesList(CategoryId categoryId) {
    return _residences.stream.map(
      (entities) =>
          entities
              .where(
                (entity) => entity.categoryId == categoryId && entity.isPopular,
              )
              .toList(),
    );
  }

  Stream<List<Residence>> _filterPopularResidencesListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    return _residences.stream.map(
      (entities) =>
          entities
              .where(
                (entity) =>
                    entity.categoryId == categoryId &&
                    entity.isPopular &&
                    entity.subCategoryId == subCategoryId,
              )
              .toList(),
    );
  }

  Residence? _filterResidenceById(
    List<Residence> entities,
    CategoryId categoryId,
    EntityId id,
  ) {
    try {
      return entities.firstWhere(
        (entity) => entity.categoryId == categoryId && entity.id == id,
      );
    } catch (e) {
      return null;
    }
  }
}
