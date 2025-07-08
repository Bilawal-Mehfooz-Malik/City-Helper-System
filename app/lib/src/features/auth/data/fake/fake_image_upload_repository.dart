import 'dart:typed_data';

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
}
