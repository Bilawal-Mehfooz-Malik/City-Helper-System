import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_details_repository.g.dart';

class FoodDetailsRepository {
  FoodDetailsRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String get foodsKey => 'food_listings';

  String getNewFoodsDocRef() {
    return _firestore.collection(foodsKey).doc().id;
  }

  Future<void> setFoodDetail(FoodDetail updated) async {
    await _docRef(updated.id).set(updated.toJson());
  }

  Future<void> updateFoodStatus(EntityId id, OperationalStatus status) async {
    await _docRef(id).update({'entityStatus': status.name});
  }

  Stream<FoodDetail?> watchFoodDetailsByOwnerId(UserId id) {
    return _docRefByOwnerId(id).snapshots().map((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        return FoodDetail.fromJson(snapshot.docs.first.data());
      }
      return null;
    });
  }

  Future<FoodDetail?> fetchFoodDetailsByOwnerId(UserId id) async {
    final residenceSnap = await _docRefByOwnerId(id).get();

    if (residenceSnap.docs.isNotEmpty) {
      return FoodDetail.fromJson(residenceSnap.docs.first.data());
    }
    return null;
  }

  Future<FoodDetail?> fetchFoodDetails(EntityId id) async {
    final doc = await _docRef(id).get();
    if (doc.exists && doc.data() != null) {
      return FoodDetail.fromJson(doc.data()!);
    }
    return null;
  }

  // Helpers
  DocumentReference<Map<String, dynamic>> _docRef(EntityId id) {
    return _firestore.collection(foodsKey).doc(id);
  }

  Query<Map<String, dynamic>> _docRefByOwnerId(UserId id) {
    return _firestore
        .collection(foodsKey)
        .where('ownerId', isEqualTo: id)
        .limit(1);
  }
}

@Riverpod(keepAlive: true)
FoodDetailsRepository foodDetailsRepository(Ref ref) {
  return FoodDetailsRepository(FirebaseFirestore.instance);
}
