import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sub_categories_repository.g.dart';

class SubCategoriesRepository {
  static String get subCategoriesKey => 'sub_categories';

  Future<List<SubCategory>> fetchSubCategoriesList() async {
    throw UnimplementedError();
  }

  Stream<List<SubCategory>> watchSubCategoriesList() {
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
SubCategoriesRepository subCategoriesRepository(Ref ref) {
  return SubCategoriesRepository();
}

@riverpod
Stream<List<SubCategory>> subCategoriesListStream(Ref ref) {
  final repo = ref.watch(subCategoriesRepositoryProvider);
  return repo.watchSubCategoriesList();
}

@riverpod
Future<List<SubCategory>> subCategoriesListFuture(Ref ref) {
  final repo = ref.watch(subCategoriesRepositoryProvider);
  return repo.fetchSubCategoriesList();
}
