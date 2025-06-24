import 'dart:typed_data';

import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/auth/domain/auth_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_upload_repository.g.dart';

class ImageUploadRepository {
  ImageUploadRepository(this._storage);
  final FirebaseStorage _storage;

  static const String collectionUsers = 'users';

  /// Upload a profile image (from image picker bytes) to Firebase Storage
  Future<String> uploadProfileImageFromBytes(
    Uint8List imageBytes,
    UserId userId,
  ) async {
    final ref = _storage.ref('$collectionUsers/$userId/profile.jpg');

    try {
      final result = await ref.putData(
        imageBytes,
        SettableMetadata(contentType: 'image/jpeg'),
      );
      return await result.ref.getDownloadURL();
    } catch (e, st) {
      AppLogger.logError(
        'Failed to delete profile image for user $userId',
        error: e,
        stackTrace: st,
      );
      throw UserProfileImageUpdateException();
    }
  }

  /// Delete the profile image for a given user
  Future<void> deleteProfileImage(UserId userId) async {
    final ref = _storage.ref('$collectionUsers/$userId/profile.jpg');

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
}

@riverpod
ImageUploadRepository imageUploadRepository(Ref ref) {
  return ImageUploadRepository(FirebaseStorage.instance);
}
