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
    required EntityDetail shop,
    required CategoryId categoryId,
    required Uint8List? coverImageBytes,
    required List<Uint8List> galleryImagesBytes,
    required List<String> galleryUrlsToDelete,
  }) async {
    state = const AsyncLoading();
    try {
      final authUser = ref.read(authStateChangesProvider).value;
      if (authUser == null) throw Exception('User not logged in'.hardcoded);

      final userId = authUser.uid;
      final shopService = ref.read(shopServiceProvider);
      final imageRepo = ref.read(imageUploadRepositoryProvider);

      final isEditing = shop.id.isNotEmpty;
      final shopId = isEditing
          ? shop.id
          : (await shopService.getShopDocument(categoryId)).id;

      // 1. Delete gallery images that were marked for removal
      if (galleryUrlsToDelete.isNotEmpty) {
        final deletionFutures = galleryUrlsToDelete.map(
          (url) => imageRepo.deleteShopGalleryImage(imageUrl: url),
        );
        await Future.wait(deletionFutures);
      }

      // 2. Upload new cover image ONLY if a new one was picked
      String? newCoverImageUrl;
      if (coverImageBytes != null) {
        newCoverImageUrl = await imageRepo.uploadShopCoverImage(
          imageBytes: coverImageBytes,
          userId: userId,
          shopId: shopId,
        );
      }

      // 3. Upload new gallery images
      final newGalleryImageUrls = await Future.wait(
        galleryImagesBytes.map(
          (bytes) => imageRepo.uploadShopGalleryImage(
            imageBytes: bytes,
            userId: userId,
            shopId: shopId,
          ),
        ),
      );

      // 4. Combine URLs for the final update
      final existingUrls = isEditing
          ? shop.galleryImageUrls
                .where((url) => !galleryUrlsToDelete.contains(url))
                .toList()
          : <String>[];
      final finalGalleryUrls = [...existingUrls, ...newGalleryImageUrls];

      // Use the new cover URL if available, otherwise keep the old one
      final finalCoverUrl = newCoverImageUrl ?? shop.coverImageUrl;

      EntityDetail finalShop;
      if (shop is ResidenceDetail) {
        finalShop = shop.copyWith(
          id: shopId,
          ownerId: userId,
          coverImageUrl: finalCoverUrl,
          galleryImageUrls: finalGalleryUrls,
        );
      } else if (shop is FoodDetail) {
        finalShop = shop.copyWith(
          id: shopId,
          ownerId: userId,
          coverImageUrl: finalCoverUrl,
          galleryImageUrls: finalGalleryUrls,
        );
      } else {
        throw InvalidCategoryException();
      }

      await shopService.setShop(categoryId, finalShop);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
