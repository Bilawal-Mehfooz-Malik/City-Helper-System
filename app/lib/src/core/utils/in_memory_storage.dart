import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'in_memory_storage.g.dart';

/// A singleton to store in-memory image data.
/// Stores images in a nested map: userId -> shopId -> imageId -> bytes
class InMemoryImageStorage {
  final Map<String, Map<String, Map<String, Uint8List>>> _images = {};

  // For user profile images (legacy, if still used)
  void storeProfileImage(String userId, Uint8List bytes) {
    _images.putIfAbsent(userId, () => {}).putIfAbsent('profile', () => {})['default'] = bytes;
  }

  Uint8List? getProfileImageBytes(String userId) {
    return _images[userId]?['profile']?['default'];
  }

  void deleteProfileImage(String userId) {
    _images[userId]?.remove('profile');
    if (_images[userId]?.isEmpty ?? false) {
      _images.remove(userId);
    }
  }

  // For shop images
  void storeShopImage(String userId, String shopId, String imageId, Uint8List bytes) {
    _images.putIfAbsent(userId, () => {}).putIfAbsent(shopId, () => {})[imageId] = bytes;
  }

  Uint8List? getShopImageBytes(String userId, String shopId, String imageId) {
    return _images[userId]?[shopId]?[imageId];
  }

  void deleteShopImage(String userId, String shopId, String imageId) {
    _images[userId]?[shopId]?.remove(imageId);
    if (_images[userId]?[shopId]?.isEmpty ?? false) {
      _images[userId]?.remove(shopId);
    }
    if (_images[userId]?.isEmpty ?? false) {
      _images.remove(userId);
    }
  }

  void deleteAllShopImages(String userId, String shopId) {
    _images[userId]?.remove(shopId);
    if (_images[userId]?.isEmpty ?? false) {
      _images.remove(userId);
    }
  }

  void clear() => _images.clear();
}

@riverpod
InMemoryImageStorage inMemoryImageStorage(Ref ref) {
  return InMemoryImageStorage();
}
