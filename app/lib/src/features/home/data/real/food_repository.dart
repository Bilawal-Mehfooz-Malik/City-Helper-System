import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/categories/food.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_repository.g.dart';

class FoodRepository {
  FoodRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String get foodsKey => 'food_listings';

  CollectionReference<Food> get _foodsRef => _firestore
      .collection(foodsKey)
      .withConverter<Food>(
        fromFirestore: (snap, _) =>
            Food.fromJson(Map<String, dynamic>.from(snap.data()!)),
        toFirestore: (food, _) => food.toJson(),
      );

  Future<void> setFood(Food food) async {
    await _foodsRef.doc(food.id).set(food);
  }

  Stream<List<Food>> watchFoodsList() {
    return _foodsRef.snapshots().map(
      (snap) => snap.docs.map((d) => d.data()).toList(),
    );
  }

  Future<List<Food>> fetchFoodsList() async {
    final snap = await _foodsRef.get();
    return snap.docs.map((d) => d.data()).toList();
  }

  Stream<List<Food>> watchPopularFoodsList() {
    return _foodsRef
        .where('isPopular', isEqualTo: true)
        .snapshots()
        .map((snap) => snap.docs.map((d) => d.data()).toList());
  }

  Future<List<Food>> fetchPopularFoodsList() async {
    final snap = await _foodsRef.where('isPopular', isEqualTo: true).get();
    return snap.docs.map((d) => d.data()).toList();
  }

  Stream<List<Food>> watchFoodsListBySubCategoryId(SubCategoryId subId) {
    return _foodsRef
        .where('subCategoryId', isEqualTo: subId)
        .snapshots()
        .map((snap) => snap.docs.map((d) => d.data()).toList());
  }

  Future<List<Food>> fetchFoodsListSubCategoryId(SubCategoryId subId) async {
    final snap = await _foodsRef.where('subCategoryId', isEqualTo: subId).get();
    return snap.docs.map((d) => d.data()).toList();
  }

  Stream<List<Food>> watchPopularFoodsListSubCategoryId(SubCategoryId subId) {
    return _foodsRef
        .where('subCategoryId', isEqualTo: subId)
        .where('isPopular', isEqualTo: true)
        .snapshots()
        .map((snap) => snap.docs.map((d) => d.data()).toList());
  }

  Future<List<Food>> fetchPopularFoodsListSubCategoryId(
    SubCategoryId subId,
  ) async {
    final snap = await _foodsRef
        .where('subCategoryId', isEqualTo: subId)
        .where('isPopular', isEqualTo: true)
        .get();
    return snap.docs.map((d) => d.data()).toList();
  }

  Future<Food?> fetchFood(EntityId id) async {
    final doc = await _foodsRef.doc(id).get();
    return doc.exists ? doc.data() : null;
  }

  Stream<Food?> watchFood(EntityId id) {
    return _foodsRef.doc(id).snapshots().map((doc) {
      return doc.exists ? doc.data() : null;
    });
  }
}

@Riverpod(keepAlive: true)
FoodRepository foodRepository(Ref ref) {
  return FoodRepository(FirebaseFirestore.instance);
}
