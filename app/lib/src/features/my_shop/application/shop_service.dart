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
import 'package:rxdart/rxdart.dart';

part 'shop_service.g.dart';

class ShopService {
  const ShopService(this.ref);
  final Ref ref;

  Stream<EntityDetail?> watchUserShopByOwnerId(UserId userId) {
    final residenceStream = ref
        .read(residenceDetailsRepositoryProvider)
        .watchResidenceDetailsByOwnerId(userId);

    return residenceStream.switchMap((residenceDetails) {
      // Check the data emitted by the residenceStream
      if (residenceDetails != null) {
        // If residence details exist, emit them as a single-value stream.
        return Stream.value(residenceDetails);
      } else {
        // If residence details are null, switch to watching the food stream.
        return ref
            .read(foodDetailsRepositoryProvider)
            .watchFoodDetailsByOwnerId(userId);
      }
    });
  }

  Future<EntityDetail?> fetchUserShopByOwnerId(UserId userId) async {
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

  /// Updates only the `entityStatus` field for a given shop document.
  Future<void> updateShopStatus({
    required String shopId,
    required CategoryId categoryId,
    required EntityStatus newStatus,
  }) async {
    switch (categoryId) {
      case 1:
        await ref
            .read(residenceDetailsRepositoryProvider)
            .updateResidenceStatus(shopId, newStatus);
        break;
      case 2:
        await ref
            .read(foodDetailsRepositoryProvider)
            .updateFoodStatus(shopId, newStatus);
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
Future<EntityDetail?> fetchUserShop(Ref ref, UserId userId) {
  final shopService = ref.read(shopServiceProvider);
  return shopService.fetchUserShopByOwnerId(userId);
}

@riverpod
Stream<EntityDetail?> watchUserShop(Ref ref, UserId userId) {
  final shopService = ref.read(shopServiceProvider);
  return shopService.watchUserShopByOwnerId(userId);
}
