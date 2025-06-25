import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/sub_category.dart';

part 'sub_categories_repository.g.dart';

class SubCategoriesRepository {
  SubCategoriesRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String get subCategoriesKey => 'subcategories';

  CollectionReference<SubCategory> get _ref => _firestore
      .collection(subCategoriesKey)
      .withConverter<SubCategory>(
        fromFirestore: (snap, _) =>
            SubCategory.fromJson(Map<String, dynamic>.from(snap.data()!)),
        toFirestore: (sub, _) => sub.toJson(),
      );

  Future<List<SubCategory>> fetchSubCategoriesList(
    CategoryId categoryId,
  ) async {
    final snap = await _ref
        .where('categoryId', isEqualTo: categoryId)
        .orderBy('sortOrder')
        .get();
    return snap.docs.map((doc) => doc.data()).toList();
  }

  Stream<List<SubCategory>> watchSubCategoriesList(CategoryId categoryId) {
    return _ref
        .where('categoryId', isEqualTo: categoryId)
        .orderBy('sortOrder')
        .snapshots()
        .map((snap) => snap.docs.map((doc) => doc.data()).toList());
  }
}

@Riverpod(keepAlive: true)
SubCategoriesRepository subCategoriesRepository(Ref ref) {
  return SubCategoriesRepository(FirebaseFirestore.instance);
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
