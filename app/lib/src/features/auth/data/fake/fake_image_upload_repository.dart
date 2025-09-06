import 'dart:typed_data';

import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_storage.dart';
import 'package:app/src/features/auth/data/image_upload_repository.dart';
import 'package:uuid/uuid.dart'; // Import Uuid for generating unique IDs

class FakeImageUploadRepository implements ImageUploadRepository {
  final InMemoryImageStorage _storage;
  final bool addDelay;
  final Uuid _uuid; // Add Uuid instance

  FakeImageUploadRepository(this._storage, {this.addDelay = true})
    : _uuid = const Uuid(); // Initialize Uuid

  @override
  Future<void> deleteProfileImage(String userId) async {
    await delay(addDelay);
    _storage.deleteProfileImage(userId); // Use new method
  }

  Uint8List? getImageBytes(String userId) =>
      _storage.getProfileImageBytes(userId); // Use new method

  @override
  Future<String> uploadUserProfileImage({
    required Uint8List imageBytes,
    required UserId userId,
  }) async {
    await delay(addDelay);
    _storage.storeProfileImage(userId, imageBytes); // Use new method
    return 'inmemory://$userId/profile'; // Updated dummy URL
  }

  @override
  Future<void> deleteAllShopImages({
    required UserId userId,
    required EntityId shopId,
  }) async {
    await delay(addDelay);
    _storage.deleteAllShopImages(userId, shopId);
  }

  @override
  Future<void> deleteShopGalleryImage({required String imageUrl}) async {
    await delay(addDelay);
    // Parse the imageUrl to extract userId, shopId, and imageId
    // Assuming imageUrl format: inmemory://<userId>/<shopId>/gallery/<imageId> or inmemory://<userId>/<shopId>/cover
    final uri = Uri.parse(imageUrl);
    final pathSegments = uri.pathSegments;

    if (pathSegments.length >= 3) {
      final userId = pathSegments[0];
      final shopId = pathSegments[1];
      final imageId = pathSegments.length == 4
          ? pathSegments[3]
          : 'cover'; // Handle cover vs gallery
      _storage.deleteShopImage(userId, shopId, imageId);
    } else {
      AppLogger.logWarning(
        'Warning: Could not parse imageUrl for deletion: $imageUrl',
      );
    }
  }

  @override
  Future<String> uploadShopCoverImage({
    required Uint8List imageBytes,
    required UserId userId,
    required EntityId shopId,
  }) async {
    await delay(addDelay);
    final imageId = 'cover'; // Fixed ID for cover image
    _storage.storeShopImage(userId, shopId, imageId, imageBytes);
    return 'inmemory://$userId/$shopId/$imageId'; // Dummy URL
  }

  @override
  Future<String> uploadShopGalleryImage({
    required Uint8List imageBytes,
    required UserId userId,
    required EntityId shopId,
  }) async {
    await delay(addDelay);
    final imageId = _uuid.v4(); // Generate unique ID for gallery image
    _storage.storeShopImage(
      userId,
      shopId,
      'gallery/$imageId',
      imageBytes,
    ); // Store under 'gallery/imageId'
    return 'inmemory://$userId/$shopId/gallery/$imageId'; // Dummy URL
  }

  @override
  Future<String> uploadShopMenuImage({
    required Uint8List imageBytes,
    required UserId userId,
    required EntityId shopId,
  }) async {
    await delay(addDelay);
    final imageId = _uuid.v4(); // Generate unique ID for menu image
    _storage.storeShopImage(
      userId,
      shopId,
      'menu/$imageId',
      imageBytes,
    ); // Store under 'menu/imageId'
    return 'inmemory://$userId/$shopId/menu/$imageId'; // Dummy URL
  }

  @override
  Future<void> deleteShopMenuImage({required String imageUrl}) async {
    await delay(addDelay);
    // Parse the imageUrl to extract userId, shopId, and imageId
    // Assuming imageUrl format: inmemory://<userId>/<shopId>/menu/<imageId>
    final uri = Uri.parse(imageUrl);
    final pathSegments = uri.pathSegments;

    if (pathSegments.length >= 3) {
      final userId = pathSegments[0];
      final shopId = pathSegments[1];
      final imageId = pathSegments.length == 4
          ? pathSegments[3]
          : 'cover'; // Handle cover vs menu
      _storage.deleteShopImage(userId, shopId, imageId);
    } else {
      AppLogger.logWarning(
        'Warning: Could not parse imageUrl for deletion: $imageUrl',
      );
    }
  }
}
