import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/home_exceptions.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/food_detail.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_service.g.dart';

class ShopService {
  const ShopService(this.ref);
  final Ref ref;

  Future<EntityDetail?> fetchUserShop(UserId userId) async {
    final residence = await ref
        .read(residenceDetailsRepositoryProvider)
        .fetchResidenceDetailsByOwnerId(userId);

    if (residence != null) {
      return residence;
    }

    final food = await ref
        .read(foodDetailsRepositoryProvider)
        .fetchFoodDetailsByOwnerId(userId);

    return food;
  }

  Stream<EntityDetail?> watchUserShop(CategoryId categoryId, UserId userId) {
    return switch (categoryId) {
      1 =>
        ref
            .read(residenceDetailsRepositoryProvider)
            .watchResidenceDetailsByOwnerId(userId),
      2 =>
        ref
            .read(foodDetailsRepositoryProvider)
            .watchFoodDetailsByOwnerId(userId),

      _ => throw InvalidCategoryException(),
    };
  }

  Future<DocumentReference> getShopDocument(CategoryId categoryId) async {
    return switch (categoryId) {
      1 => ref.read(residenceDetailsRepositoryProvider).getNewResidenceDocRef(),
      2 => ref.read(foodDetailsRepositoryProvider).getNewFoodsDocRef(),
      _ => throw InvalidCategoryException(),
    };
  }

  Future<void> setShop(CategoryId categoryId, EntityDetail shop) async {
    switch (categoryId) {
      case 1:
        await ref
            .read(residenceDetailsRepositoryProvider)
            .setResidenceDetail(shop as ResidenceDetail);

        break;
      case 2:
        await ref
            .read(foodDetailsRepositoryProvider)
            .setFoodDetail(shop as FoodDetail);

        break;
      default:
        throw InvalidCategoryException();
    }
  }
}

@riverpod
ShopService shopService(Ref ref) {
  return ShopService(ref);
}

@riverpod
Future<EntityDetail?> userShop(Ref ref, UserId userId) {
  final shopService = ref.read(shopServiceProvider);
  return shopService.fetchUserShop(userId);
}
