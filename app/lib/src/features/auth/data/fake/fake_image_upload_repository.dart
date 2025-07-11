import 'dart:typed_data';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_storage.dart';
import 'package:app/src/features/auth/data/image_upload_repository.dart';

class FakeImageUploadRepository implements ImageUploadRepository {
  final InMemoryImageStorage _storage;
  final bool addDelay;

  FakeImageUploadRepository(this._storage, {this.addDelay = true});

  @override
  Future<String> uploadProfileImageFromBytes(
    Uint8List imageBytes,
    String userId,
  ) async {
    await delay(addDelay);
    _storage.storeImage(userId, imageBytes);
    return 'inmemory://$userId';
  }

  @override
  Future<void> deleteProfileImage(String userId) async {
    await delay(addDelay);
    _storage.getImageBytes(userId);
  }

  Uint8List? getImageBytes(String userId) => _storage.getImageBytes(userId);

  @override
  Future<String> uploadShopImageFromBytes({
    required Uint8List imageBytes,
    required String startPath,
    required EntityId shopId,
    required String endPath,
  }) {
    // TODO: implement uploadShopImageFromBytes
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAllShopImages({
    required UserId userId,
    required EntityId shopId,
  }) {
    // TODO: implement deleteAllShopImages
    throw UnimplementedError();
  }

  @override
  Future<void> deleteShopGalleryImage({required String imageUrl}) {
    // TODO: implement deleteShopGalleryImage
    throw UnimplementedError();
  }

  @override
  Future<String> uploadShopCoverImage({
    required Uint8List imageBytes,
    required UserId userId,
    required EntityId shopId,
  }) {
    // TODO: implement uploadShopCoverImage
    throw UnimplementedError();
  }

  @override
  Future<String> uploadShopGalleryImage({
    required Uint8List imageBytes,
    required UserId userId,
    required EntityId shopId,
  }) {
    // TODO: implement uploadShopGalleryImage
    throw UnimplementedError();
  }

  @override
  Future<String> uploadUserProfileImage({
    required Uint8List imageBytes,
    required UserId userId,
  }) {
    // TODO: implement uploadUserProfileImage
    throw UnimplementedError();
  }
}
