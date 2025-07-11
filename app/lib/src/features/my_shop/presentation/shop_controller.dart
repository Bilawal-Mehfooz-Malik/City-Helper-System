import 'dart:typed_data';

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

  /// Sets (creates or updates) a shop, handles all image uploads and deletions,
  /// and returns `true` on success and `false` on failure.
  Future<bool> setShop({
    required EntityDetail shop,
    Uint8List? newCoverImageBytes,
    List<Uint8List>? newGalleryImagesBytes,
    List<String>? galleryImageUrlsToDelete,
    bool isCoverImageDeleted = false,
  }) async {
    state = const AsyncLoading();

    try {
      final authUser = ref.read(authStateChangesProvider).value;
      if (authUser == null) throw Exception('User not logged in'.hardcoded);

      final userId = authUser.uid;
      final shopService = ref.read(shopServiceProvider);
      final imageRepo = ref.read(imageUploadRepositoryProvider);

      final isEditMode = shop.id.isNotEmpty;
      String shopId = isEditMode
          ? shop.id
          : (await shopService.getShopDocument(shop.categoryId)).id;

      // --- 1. Handle Image Deletions (only in edit mode) ---
      if (isEditMode) {
        if (isCoverImageDeleted && shop.coverImageUrl.isNotEmpty) {
          await imageRepo.deleteImage(shop.coverImageUrl);
        }
        if (galleryImageUrlsToDelete != null) {
          for (final url in galleryImageUrlsToDelete) {
            await imageRepo.deleteImage(url);
          }
        }
      }

      // --- 2. Handle Image Uploads ---
      String? coverImageUrl = shop.coverImageUrl;
      if (newCoverImageBytes != null) {
        coverImageUrl = await imageRepo.uploadShopImageFromBytes(
          startPath: 'shops/$userId',
          shopId: shopId,
          endPath: 'coverImage',
          imageBytes: newCoverImageBytes,
        );
      }

      final List<String> galleryImageUrls = List.from(shop.galleryImageUrls);
      if (newGalleryImagesBytes != null) {
        for (int i = 0; i < newGalleryImagesBytes.length; i++) {
          final url = await imageRepo.uploadShopImageFromBytes(
            startPath: 'shops/$userId',
            shopId: shopId,
            endPath: 'galleryImage_${DateTime.now().millisecondsSinceEpoch}_$i',
            imageBytes: newGalleryImagesBytes[i],
          );
          galleryImageUrls.add(url);
        }
      }
      // Remove deleted urls from the final list
      if (galleryImageUrlsToDelete != null) {
        galleryImageUrls.removeWhere(
          (url) => galleryImageUrlsToDelete.contains(url),
        );
      }

      // --- 3. Create Final Shop Object and Save ---
      EntityDetail finalShop;
      if (shop is ResidenceDetail) {
        finalShop = shop.copyWith(
          id: shopId,
          ownerId: userId,
          coverImageUrl: coverImageUrl,
          galleryImageUrls: galleryImageUrls,
        );
      } else if (shop is FoodDetail) {
        finalShop = shop.copyWith(
          id: shopId,
          ownerId: userId,
          coverImageUrl: coverImageUrl,
          galleryImageUrls: galleryImageUrls,
        );
      } else {
        throw InvalidCategoryException();
      }

      await shopService.setShop(finalShop.categoryId, finalShop);
      state = const AsyncData(null);
      return true; // Success!
    } catch (e, st) {
      state = AsyncError(e, st);
      return false; // Failure!
    }
  }
}
