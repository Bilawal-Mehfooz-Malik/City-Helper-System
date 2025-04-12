import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sub_categories_repository.g.dart';

class SubCategoriesRepository {
  static String get subCategoriesKey => 'sub_categories';

  Future<List<SubCategory>> fetchSubCategoriesList(CategoryId id) async {
    throw UnimplementedError();
  }

  Stream<List<SubCategory>> watchSubCategoriesList(CategoryId id) {
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
SubCategoriesRepository subCategoriesRepository(Ref ref) {
  return SubCategoriesRepository();
}

@riverpod
Stream<List<SubCategory>> subCategoriesListStream(Ref ref, CategoryId id) {
  final repo = ref.watch(subCategoriesRepositoryProvider);
  return repo.watchSubCategoriesList(id);
}

@riverpod
Future<List<SubCategory>> subCategoriesListFuture(Ref ref, CategoryId id) {
  final repo = ref.watch(subCategoriesRepositoryProvider);
  return repo.fetchSubCategoriesList(id);
}
