import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/food_detail.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_repository.g.dart';

class ShopRepository {
  final FirebaseFirestore _firestore;

  ShopRepository(this._firestore);

  Future<EntityDetail?> fetchUserShop(String userId) async {
    final residenceSnap = await _firestore
        .collection('residence_listings')
        .where('ownerId', isEqualTo: userId)
        .limit(1)
        .get();

    if (residenceSnap.docs.isNotEmpty) {
      return ResidenceDetail.fromJson(residenceSnap.docs.first.data());
    }

    final foodSnap = await _firestore
        .collection('food_listings')
        .where('ownerId', isEqualTo: userId)
        .limit(1)
        .get();

    if (foodSnap.docs.isNotEmpty) {
      return FoodDetail.fromJson(foodSnap.docs.first.data());
    }

    return null;
  }
}

@riverpod
ShopRepository shopRepository(Ref ref) {
  return ShopRepository(FirebaseFirestore.instance);
}

@riverpod
Future<EntityDetail?> userShop(Ref ref, UserId userId) async {
  final repo = ref.watch(shopRepositoryProvider);
  return repo.fetchUserShop(userId);
}
