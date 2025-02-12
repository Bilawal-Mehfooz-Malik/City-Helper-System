import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'categories_repository.g.dart';

class CategoriesRepository {
  CategoriesRepository(this._supabase);
  final SupabaseClient _supabase;

  static String get categoriesKey => 'categories';

  Future<List<Category>> fetchCategoriesList() async {
    final response = await _supabase.from(categoriesKey).select();
    return response.map((json) => Category.fromJson(json)).toList();
  }

  Future<Category?> fetchCategory(int id) async {
    final response =
        await _supabase.from(categoriesKey).select().eq('id', id).maybeSingle();

    return response != null ? Category.fromJson(response) : null;
  }

  Stream<List<Category>> watchCategoriesList() {
    return _supabase.from(categoriesKey).stream(primaryKey: ['id']).map(
      (data) => data.map((json) => Category.fromJson(json)).toList(),
    );
  }

  Stream<Category?> watchCategory(int id) {
    return _supabase
        .from(categoriesKey)
        .stream(primaryKey: ['id'])
        .eq('id', id)
        .map((data) => data.isNotEmpty ? Category.fromJson(data.first) : null);
  }
}

@Riverpod(keepAlive: true)
CategoriesRepository categoriesRepository(Ref ref) {
  return CategoriesRepository(Supabase.instance.client);
}

@riverpod
Stream<List<Category>> categoriesListStream(Ref ref) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return categoriesRepository.watchCategoriesList();
}

@riverpod
Future<List<Category>> categoriesListFuture(Ref ref) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
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
