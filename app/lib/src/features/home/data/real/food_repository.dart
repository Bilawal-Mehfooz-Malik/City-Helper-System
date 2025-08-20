import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_repository.g.dart';

class FoodRepository {
  FoodRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String get foodsKey => 'food_listings';

  /// Writes a food document.
  Future<void> setFood(Food food) async {
    await _foodsRef.doc(food.id).set(food);
  }

  Future<List<Food>> fetchFoodsList({
    required int limit,
    required FoodFilter filter,
    String? lastEntityId,
  }) async {
    var query = _approvedFoodsQuery.where('isPopular', isEqualTo: false);
    query = _buildFilteredQuery(query, filter);

    query = query.limit(limit);

    if (lastEntityId != null) {
      final lastDoc = await _foodsRef.doc(lastEntityId).get();
      if (lastDoc.exists) {
        query = query.startAfterDocument(lastDoc);
      }
    }
    final snap = await query.get();
    return snap.docs.map((d) => d.data()).toList();
  }

  Future<List<Food>> fetchFoodsListSubCategoryId(
    SubCategoryId subId, {
    required int limit,
    required FoodFilter filter,
    String? lastEntityId,
  }) async {
    var query = _approvedFoodsQuery
        .where('subCategoryId', isEqualTo: subId)
        .where('isPopular', isEqualTo: false);

    query = _buildFilteredQuery(query, filter);

    query = query.limit(limit);

    if (lastEntityId != null) {
      final lastDoc = await _foodsRef.doc(lastEntityId).get();
      if (lastDoc.exists) {
        query = query.startAfterDocument(lastDoc);
      }
    }
    final snap = await query.get();
    return snap.docs.map((d) => d.data()).toList();
  }

  Future<List<Food>> fetchPopularFoodsList({
    required int limit,
    required FoodFilter filter,
    String? lastEntityId,
  }) async {
    var query = _approvedFoodsQuery.where('isPopular', isEqualTo: true);

    query = _buildFilteredQuery(query, filter);

    query = query.limit(limit);

    if (lastEntityId != null) {
      final lastDoc = await _foodsRef.doc(lastEntityId).get();
      if (lastDoc.exists) {
        query = query.startAfterDocument(lastDoc);
      }
    }
    final snap = await query.get();
    return snap.docs.map((d) => d.data()).toList();
  }

  Future<List<Food>> fetchPopularFoodsListSubCategoryId(
    SubCategoryId subId, {
    required int limit,
    required FoodFilter filter,
    String? lastEntityId,
  }) async {
    var query = _approvedFoodsQuery
        .where('subCategoryId', isEqualTo: subId)
        .where('isPopular', isEqualTo: true);

    query = _buildFilteredQuery(query, filter);

    query = query.limit(limit);

    if (lastEntityId != null) {
      final lastDoc = await _foodsRef.doc(lastEntityId).get();
      if (lastDoc.exists) {
        query = query.startAfterDocument(lastDoc);
      }
    }

    final snap = await query.get();
    return snap.docs.map((d) => d.data()).toList();
  }


  /// Fetches a single food document by its ID
  Future<Food?> fetchFood(EntityId id) async {
    final doc = await _foodsRef.doc(id).get();
    return doc.exists ? doc.data() : null;
  }

  /// Watches a single food document by its ID
  Stream<Food?> watchFood(EntityId id) {
    return _foodsRef.doc(id).snapshots().map((doc) {
      return doc.exists ? doc.data() : null;
    });
  }

  // --------------------Helpers--------------------------------

  Query<Food> _buildFilteredQuery(Query<Food> query, FoodFilter filter) {
    var newQuery = query;
    if (filter.genderPref != GenderPreference.any) {
      newQuery = newQuery.where('genderPref', isEqualTo: filter.genderPref.name);
    }
    if (filter.ratingSort != SortOrder.none) {
      newQuery = newQuery
          .where('avgRating', isGreaterThanOrEqualTo: 0)
          .orderBy('avgRating',
              descending: filter.ratingSort == SortOrder.highToLow);
    }
    return newQuery;
  }

  /// A pre-filtered query that only includes documents with an "approved" status.
  Query<Food> get _approvedFoodsQuery =>
      _foodsRef.where('status', isEqualTo: ApprovalStatus.approved.name);

  /// The base collection reference without any filters.
  CollectionReference<Food> get _foodsRef => _firestore
      .collection(foodsKey)
      .withConverter<Food>(
        fromFirestore: (snap, _) =>
            Food.fromJson(Map<String, dynamic>.from(snap.data()!)),
        toFirestore: (food, _) => food.toJson(),
      );
}

@Riverpod(keepAlive: true)
FoodRepository foodRepository(Ref ref) {
  return FoodRepository(FirebaseFirestore.instance);
}