import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_repository.g.dart';

class FoodRepository {
  FoodRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String get foodsKey => 'food_listings';

  /// The base collection reference without any filters.
  CollectionReference<Food> get _foodsRef => _firestore
      .collection(foodsKey)
      .withConverter<Food>(
        fromFirestore: (snap, _) =>
            Food.fromJson(Map<String, dynamic>.from(snap.data()!)),
        toFirestore: (food, _) => food.toJson(),
      );

  // THIS IS THE KEY CHANGE:
  /// A pre-filtered query that only includes documents with an "approved" status.
  Query<Food> get _approvedFoodsQuery =>
      _foodsRef.where('status', isEqualTo: ApprovalStatus.approved.name);

  /// Writes a food document. Uses the unfiltered ref.
  Future<void> setFood(Food food) async {
    await _foodsRef.doc(food.id).set(food);
  }

  /// Watches a list of all approved foods.
  Stream<List<Food>> watchFoodsList() {
    // Uses the new filtered query
    return _approvedFoodsQuery.snapshots().map(
      (snap) => snap.docs.map((d) => d.data()).toList(),
    );
  }

  /// Fetches a list of all approved foods.
  Future<List<Food>> fetchFoodsList() async {
    // Uses the new filtered query
    final snap = await _approvedFoodsQuery.get();
    return snap.docs.map((d) => d.data()).toList();
  }

  /// Watches a list of popular, approved foods.
  Stream<List<Food>> watchPopularFoodsList() {
    return _approvedFoodsQuery
        .where('isPopular', isEqualTo: true)
        .snapshots()
        .map((snap) => snap.docs.map((d) => d.data()).toList());
  }

  /// Fetches a list of popular, approved foods.
  Future<List<Food>> fetchPopularFoodsList() async {
    final snap = await _approvedFoodsQuery
        .where('isPopular', isEqualTo: true)
        .get();
    return snap.docs.map((d) => d.data()).toList();
  }

  /// Watches a list of approved foods by sub-category.
  Stream<List<Food>> watchFoodsListBySubCategoryId(SubCategoryId subId) {
    return _approvedFoodsQuery
        .where('subCategoryId', isEqualTo: subId)
        .snapshots()
        .map((snap) => snap.docs.map((d) => d.data()).toList());
  }

  // ... (Apply the same change to other list-fetching methods) ...
  Future<List<Food>> fetchFoodsListSubCategoryId(SubCategoryId subId) async {
    final snap = await _approvedFoodsQuery
        .where('subCategoryId', isEqualTo: subId)
        .get();
    return snap.docs.map((d) => d.data()).toList();
  }

  Stream<List<Food>> watchPopularFoodsListSubCategoryId(SubCategoryId subId) {
    return _approvedFoodsQuery
        .where('subCategoryId', isEqualTo: subId)
        .where('isPopular', isEqualTo: true)
        .snapshots()
        .map((snap) => snap.docs.map((d) => d.data()).toList());
  }

  Future<List<Food>> fetchPopularFoodsListSubCategoryId(
    SubCategoryId subId,
  ) async {
    final snap = await _approvedFoodsQuery
        .where('subCategoryId', isEqualTo: subId)
        .where('isPopular', isEqualTo: true)
        .get();
    return snap.docs.map((d) => d.data()).toList();
  }

  /// Fetches a single food document by its ID, regardless of its status.
  Future<Food?> fetchFood(EntityId id) async {
    // Uses the original, unfiltered ref
    final doc = await _foodsRef.doc(id).get();
    return doc.exists ? doc.data() : null;
  }

  /// Watches a single food document by its ID, regardless of its status.
  Stream<Food?> watchFood(EntityId id) {
    // Uses the original, unfiltered ref
    return _foodsRef.doc(id).snapshots().map((doc) {
      return doc.exists ? doc.data() : null;
    });
  }
}

@Riverpod(keepAlive: true)
FoodRepository foodRepository(Ref ref) {
  return FoodRepository(FirebaseFirestore.instance);
}
