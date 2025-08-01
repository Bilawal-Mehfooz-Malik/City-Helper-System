import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_repository.g.dart';

class CategoriesRepository {
  CategoriesRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String get categoriesKey => 'categories';

  CollectionReference<Category> get _categoriesRef => _firestore
      .collection(categoriesKey)
      .withConverter<Category>(
        fromFirestore: (snapshot, _) =>
            Category.fromJson(Map<String, dynamic>.from(snapshot.data()!)),
        toFirestore: (category, _) => category.toJson(),
      );

  Future<List<Category>> fetchCategoriesList() async {
    final snapshot = await _categoriesRef.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Stream<List<Category>> watchCategoriesList() {
    return _categoriesRef.snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
    );
  }

  Future<Category?> fetchCategory(CategoryId id) async {
    final query = await _categoriesRef
        .where('id', isEqualTo: id)
        .limit(1)
        .get();
    if (query.docs.isNotEmpty) {
      return query.docs.first.data();
    }
    return null;
  }

  Stream<Category?> watchCategory(CategoryId id) {
    return _categoriesRef
        .where('id', isEqualTo: id)
        .limit(1)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.isNotEmpty ? snapshot.docs.first.data() : null,
        );
  }
}

@Riverpod(keepAlive: true)
CategoriesRepository categoriesRepository(Ref ref) {
  return CategoriesRepository(FirebaseFirestore.instance);
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
Stream<Category?> categoryStream(Ref ref, CategoryId id) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return categoriesRepository.watchCategory(id);
}

@riverpod
Future<Category?> categoryFuture(Ref ref, CategoryId id) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return categoriesRepository.fetchCategory(id);
}
