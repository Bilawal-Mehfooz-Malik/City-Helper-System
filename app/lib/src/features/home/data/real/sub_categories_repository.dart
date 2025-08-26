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

  Future<SubCategory?> fetchSubCategory(SubCategoryId id) async {
    final query = await _ref.where('id', isEqualTo: id).limit(1).get();
    if (query.docs.isNotEmpty) {
      return query.docs.first.data();
    }
    return null;
  }
}

@Riverpod(keepAlive: true)
SubCategoriesRepository subCategoriesRepository(Ref ref) {
  return SubCategoriesRepository(FirebaseFirestore.instance);
}

@Riverpod(keepAlive: true)
Future<List<SubCategory>> subCategoriesListFuture(Ref ref, CategoryId id) {
  final repo = ref.watch(subCategoriesRepositoryProvider);
  return repo.fetchSubCategoriesList(id);
}

@Riverpod(keepAlive: true)
Future<SubCategory?> subCategoryFuture(Ref ref, SubCategoryId id) {
  final categoriesRepository = ref.watch(subCategoriesRepositoryProvider);
  return categoriesRepository.fetchSubCategory(id);
}
