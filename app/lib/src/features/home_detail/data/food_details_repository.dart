import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/domain/food_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_details_repository.g.dart';

class FoodDetailsRepository {
  FoodDetailsRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String get foodsKey => 'food_listings';

  DocumentReference<Map<String, dynamic>> _docRef(EntityId id) {
    return _firestore.collection(foodsKey).doc(id);
  }

  /// ✅ Save or update a FoodDetail
  Future<void> setFoodDetail(FoodDetail updated) async {
    await _docRef(updated.id).set(updated.toJson());
  }

  /// ✅ Real-time updates
  Stream<FoodDetail?> watchFoodDetails(EntityId id) {
    return _docRef(id).snapshots().map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        return FoodDetail.fromJson(snapshot.data()!);
      }
      return null;
    });
  }

  /// ✅ One-time fetch
  Future<FoodDetail?> fetchFoodDetails(EntityId id) async {
    final doc = await _docRef(id).get();
    if (doc.exists && doc.data() != null) {
      return FoodDetail.fromJson(doc.data()!);
    }
    return null;
  }
}

@Riverpod(keepAlive: true)
FoodDetailsRepository foodDetailsRepository(Ref ref) {
  return FoodDetailsRepository(FirebaseFirestore.instance);
}
