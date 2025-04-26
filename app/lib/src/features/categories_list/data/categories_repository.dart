import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_repository.g.dart';

class CategoriesRepository {
  static String get categoriesKey => 'categories';

  Future<List<Category>> fetchCategoriesList() async {
    throw UnimplementedError();
  }

  Stream<List<Category>> watchCategoriesList() {
    throw UnimplementedError();
  }

  Future<Category?> fetchCategory(int id) async {
    throw UnimplementedError();
  }

  Stream<Category?> watchCategory(int id) {
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
CategoriesRepository categoriesRepository(Ref ref) {
  return CategoriesRepository();
}

@riverpod
Stream<List<Category>> categoriesListStream(Ref ref) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return categoriesRepository.watchCategoriesList();
}

@riverpod
Future<List<Category>> categoriesListFuture(Ref ref) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  // throw Exception('Error fetching categories list');
  return categoriesRepository.fetchCategoriesList();
}

@riverpod
Stream<Category?> categoryStream(Ref ref, int id) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return categoriesRepository.watchCategory(id);
}

@riverpod
Future<Category?> categoryFuture(Ref ref, int id) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return categoriesRepository.fetchCategory(id);
}
