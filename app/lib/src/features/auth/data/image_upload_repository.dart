import 'dart:typed_data';

import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/auth/domain/auth_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'image_upload_repository.g.dart';

class ImageUploadRepository {
  ImageUploadRepository(this._storage);
  final FirebaseStorage _storage;

  static const String _shopsPath = 'shops';
  static const String _usersPath = 'users';
  static const String _profileImage = 'profile.jpg';
  static const String _coverImage = 'cover.jpg';
  static const String _galleryFolder = 'gallery';
  static const String _menuFolder = 'menu';

  // --- SHOP IMAGE METHODS ---

  Future<String> uploadUserProfileImage({
    required Uint8List imageBytes,
    required UserId userId,
  }) async {
    final ref = _userProfileRef(userId);
    return await _uploadData(ref, imageBytes, "User Profile: $userId");
  }

  /// Delete the profile image for a given user
  Future<void> deleteProfileImage(UserId userId) async {
    final ref = _userProfileRef(userId);

    try {
      await ref.delete();
    } catch (e, st) {
      AppLogger.logError(
        'Failed to delete profile image for user $userId',
        error: e,
        stackTrace: st,
      );
      throw UserProfileImageDeleteException();
    }
  }

  Future<String> uploadShopCoverImage({
    required Uint8List imageBytes,
    required UserId userId,
    required EntityId shopId,
  }) async {
    final ref = _shopCoverRef(userId, shopId);
    return await _uploadData(ref, imageBytes, "Shop Cover: $shopId");
  }

  Future<String> uploadShopGalleryImage({
    required Uint8List imageBytes,
    required UserId userId,
    required EntityId shopId,
  }) async {
    final imageId = const Uuid().v4();
    final ref = _shopGalleryImageRef(userId, shopId, imageId);
    return await _uploadData(ref, imageBytes, "Shop Gallery: $shopId");
  }

  Future<String> uploadShopMenuImage({
    required Uint8List imageBytes,
    required UserId userId,
    required EntityId shopId,
  }) async {
    final imageId = const Uuid().v4();
    final ref = _shopMenuImageRef(userId, shopId, imageId);
    return await _uploadData(ref, imageBytes, "Shop Menu: $shopId");
  }

  Future<void> deleteShopGalleryImage({required String imageUrl}) async {
    try {
      final ref = _storage.refFromURL(imageUrl);
      await ref.delete();
    } catch (e, st) {
      AppLogger.logError(
        'Failed to delete gallery image',
        error: e,
        stackTrace: st,
      );
    }
  }

  Future<void> deleteShopMenuImage({required String imageUrl}) async {
    try {
      final ref = _storage.refFromURL(imageUrl);
      await ref.delete();
    } catch (e, st) {
      AppLogger.logError(
        'Failed to delete menu image',
        error: e,
        stackTrace: st,
      );
    }
  }

  Future<void> deleteAllShopImages({
    required UserId userId,
    required EntityId shopId,
  }) async {
    final shopFolderRef = _shopRootRef(userId, shopId);
    try {
      final listResult = await shopFolderRef.listAll();

      final rootDeletions = listResult.items.map((item) => item.delete());
      final folderDeletions = listResult.prefixes.map((prefix) async {
        final subList = await prefix.listAll();
        return Future.wait(subList.items.map((item) => item.delete()));
      });

      await Future.wait([...rootDeletions, ...folderDeletions]);
    } catch (e, st) {
      AppLogger.logError(
        'Failed to delete all images for shop $shopId',
        error: e,
        stackTrace: st,
      );
      throw ShopImageDeleteException();
    }
  }

  // --- PRIVATE HELPERS ---

  Reference _userProfileRef(UserId userId) =>
      _storage.ref('$_usersPath/$userId/$_profileImage');

  Reference _shopCoverRef(UserId userId, EntityId shopId) =>
      _storage.ref('$_shopsPath/$userId/$shopId/$_coverImage');

  Reference _shopGalleryImageRef(
    UserId userId,
    EntityId shopId,
    String imageId,
  ) => _storage.ref('$_shopsPath/$userId/$shopId/$_galleryFolder/$imageId.jpg');

  Reference _shopMenuImageRef(
    UserId userId,
    EntityId shopId,
    String imageId,
  ) => _storage.ref('$_shopsPath/$userId/$shopId/$_menuFolder/$imageId.jpg');

  Reference _shopRootRef(UserId userId, EntityId shopId) =>
      _storage.ref('$_shopsPath/$userId/$shopId');

  Future<String> _uploadData(
    Reference ref,
    Uint8List data,
    String logContext,
  ) async {
    try {
      final result = await ref.putData(
        data,
        SettableMetadata(contentType: 'image/jpeg'),
      );
      return await result.ref.getDownloadURL();
    } catch (e, st) {
      AppLogger.logError(
        'Failed to upload image for $logContext',
        error: e,
        stackTrace: st,
      );
      throw ShopImageUploadException();
    }
  }
}

@riverpod
ImageUploadRepository imageUploadRepository(Ref ref) {
  return ImageUploadRepository(FirebaseStorage.instance);
}
