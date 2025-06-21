import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/categories/residence.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'residence_repository.g.dart';

class ResidenceRepository {
  static String get residencesKey => 'residences';

  Future<void> setResidence(Residence residence) async {
    throw UnimplementedError();
  }

  Stream<List<Residence>> watchResidencesList(CategoryId categoryId) {
    throw UnimplementedError();
  }

  Future<List<Residence>> fetchResidencesList(CategoryId categoryId) {
    throw UnimplementedError();
  }

  Stream<List<Residence>> watchPopularResidencesList(CategoryId categoryId) {
    throw UnimplementedError();
  }

  Future<List<Residence>> fetchPopularResidencesList(CategoryId categoryId) {
    throw UnimplementedError();
  }

  Stream<List<Residence>> watchResidencesListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    throw UnimplementedError();
  }

  Future<List<Residence>> fetchResidencesListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    throw UnimplementedError();
  }

  Stream<List<Residence>> watchPopularResidencesListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    throw UnimplementedError();
  }

  Future<List<Residence>> fetchPopularResidencesListBySubCategoryId(
    CategoryId categoryId,
    SubCategoryId subCategoryId,
  ) {
    throw UnimplementedError();
  }

  Stream<Residence?> watchResidence(CategoryId categoryId, EntityId id) {
    throw UnimplementedError();
  }

  Future<Residence?> fetchResidence(CategoryId categoryId, EntityId id) {
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
ResidenceRepository residenceRepository(Ref ref) {
  return ResidenceRepository();
}
