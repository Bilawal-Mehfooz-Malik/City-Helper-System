import 'dart:typed_data';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/data/image_upload_repository.dart';
import 'package:app/src/features/home/domain/home_exceptions.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/food_detail.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:app/src/features/my_shop/application/shop_service.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_controller.g.dart';

@riverpod
class ShopController extends _$ShopController {
  @override
  FutureOr<void> build() {}

  Future<void> setShop({
    required CategoryId categoryId,
    required EntityDetail shop,
    required Uint8List coverImageBytes,
    required List<Uint8List> galleryImagesBytes,
  }) async {
    state = const AsyncLoading();

    try {
      final authUser = ref.read(authStateChangesProvider).value;
      if (authUser == null) throw Exception('User not logged in'.hardcoded);

      final userId = authUser.uid;
      final shopService = ref.read(shopServiceProvider);
      final imageRepo = ref.read(imageUploadRepositoryProvider);

      // Generate doc ref to get the ID
      final docRef = await shopService.getShopDocument(categoryId);
      final shopId = docRef.id;

      // Upload cover image
      final coverImageUrl = await imageRepo.uploadShopImageFromBytes(
        startPath: 'shops/$userId',
        shopId: shopId,
        endPath: 'coverImage',
        imageBytes: coverImageBytes,
      );

      // Upload gallery images
      final galleryImageUrls = <String>[];
      for (int i = 0; i < galleryImagesBytes.length; i++) {
        final url = await imageRepo.uploadShopImageFromBytes(
          startPath: 'shops/$userId',
          shopId: shopId,
          endPath: 'galleryImage$i',
          imageBytes: galleryImagesBytes[i],
        );
        galleryImageUrls.add(url);
      }

      // Final shop object with uploaded URLs
      if (shop is ResidenceDetail) {
        final newShop = shop.copyWith(
          id: shopId,
          ownerId: userId,
          coverImageUrl: coverImageUrl,
          galleryImageUrls: galleryImageUrls,
        );
        await shopService.setShop(categoryId, newShop);
      } else if (shop is FoodDetail) {
        final newShop = shop.copyWith(
          id: shopId,
          ownerId: userId,
          coverImageUrl: coverImageUrl,
          galleryImageUrls: galleryImageUrls,
        );
        await shopService.setShop(categoryId, newShop);
      } else {
        throw InvalidCategoryException();
      }
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
