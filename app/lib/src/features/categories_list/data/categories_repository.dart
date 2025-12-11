import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesRepository {
  CategoriesRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String get categoriesKey => 'categories';

  Future<List<Category>> fetchCategoriesList() async {
    try {
      final snapshot = await _categoriesRef.get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e, st) {
      AppLogger.logError(
        'Failed to Fetch Categories'.hardcoded,
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Stream<List<Category>> watchCategoriesList() {
    try {
      return _categoriesRef.snapshots().map(
        (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
      );
    } catch (e, st) {
      AppLogger.logError(
        'Failed to watch Categories'.hardcoded,
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<Category?> fetchCategory(CategoryId id) async {
    try {
      final query = await _categoriesRef
          .where('id', isEqualTo: id)
          .limit(1)
          .get();
      if (query.docs.isNotEmpty) {
        return query.docs.first.data();
      }
      return null;
    } catch (e, st) {
      AppLogger.logError(
        'Failed to Fetch Category'.hardcoded,
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Stream<Category?> watchCategory(CategoryId id) {
    try {
      return _categoriesRef
          .where('id', isEqualTo: id)
          .limit(1)
          .snapshots()
          .map(
            (snapshot) =>
                snapshot.docs.isNotEmpty ? snapshot.docs.first.data() : null,
          );
    } catch (e, st) {
      AppLogger.logError(
        'Failed to watch Category'.hardcoded,
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  CollectionReference<Category> get _categoriesRef => _firestore
      .collection(categoriesKey)
      .withConverter<Category>(
        fromFirestore: (snapshot, _) =>
            Category.fromJson(Map<String, dynamic>.from(snapshot.data()!)),
        toFirestore: (category, _) => category.toJson(),
      );
}

final categoriesRepositoryProvider = Provider<CategoriesRepository>((ref) {
  return CategoriesRepository(FirebaseFirestore.instance);
});

final categoriesListStreamProvider = StreamProvider<List<Category>>((ref) {
  final repo = ref.watch(categoriesRepositoryProvider);
  return repo.watchCategoriesList();
});

final categoriesListFutureProvider = FutureProvider<List<Category>>((ref) {
  final repo = ref.watch(categoriesRepositoryProvider);
  return repo.fetchCategoriesList();
});

final categoryStreamProvider = StreamProvider.family<Category?, CategoryId>((
  ref,
  id,
) {
  final repo = ref.watch(categoriesRepositoryProvider);
  return repo.watchCategory(id);
});

final categoryFutureProvider = FutureProvider.family<Category?, CategoryId>((
  ref,
  id,
) {
  final repo = ref.watch(categoriesRepositoryProvider);
  return repo.fetchCategory(id);
});
