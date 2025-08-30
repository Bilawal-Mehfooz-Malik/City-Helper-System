import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'in_memory_storage.g.dart';

/// A singleton to store in-memory image data using userId as the key.
class InMemoryImageStorage {
  final Map<String, Uint8List> _images = {};

  void storeImage(String userId, Uint8List bytes) {
    _images[userId] = bytes;
  }

  Uint8List? getImageBytes(String userId) => _images[userId];

  void deleteImage(String userId) {
    _images.remove(userId);
  }

  void clear() => _images.clear();
}

@riverpod
InMemoryImageStorage inMemoryImageStorage(Ref ref) {
  return InMemoryImageStorage();
}
