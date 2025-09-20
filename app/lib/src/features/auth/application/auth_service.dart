import 'dart:typed_data';

import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/data/image_upload_repository.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:app/src/features/auth/domain/app_user.dart';
import 'package:app/src/features/auth/domain/auth_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

class AuthService {
  const AuthService(this.ref);
  final Ref ref;

  Future<String> uploadUserProfileImage(
    Uint8List imageBytes,
    UserId userId,
  ) async {
    try {
      return await ref
          .read(imageUploadRepositoryProvider)
          .uploadUserProfileImage(imageBytes: imageBytes, userId: userId);
    } catch (e, st) {
      AppLogger.logError(
        'Failed to upload profile image for user $userId',
        error: e,
        stackTrace: st,
      );
      throw UserProfileImageUpdateException();
    }
  }

  /// Creates or updates user profile in Firestore after OTP verification
  Future<void> createUserProfile({
    required String name,
    Uint8List? profileImageBytes,
    LatLng? location,
  }) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotAuthenticatedException();
    }

    final defaultLocation = ref.read(defaultLocationProvider);

    String? imageUrl;
    if (profileImageBytes != null) {
      imageUrl = await uploadUserProfileImage(profileImageBytes, user.uid);
    }

    final appUser = AppUser(
      uid: user.uid,
      name: name,
      phoneNumber: user.phoneNumber,
      profileImageUrl: imageUrl,
      lastLocation: location ?? defaultLocation,
    );

    await ref.read(userRepositoryProvider).createUserProfile(user: appUser);
  }

  Future<void> updateUserProfile({
    String? name,
    Uint8List? profileImageBytes,
    LatLng? location,
    bool removeProfileImage = false,
  }) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotAuthenticatedException();
    }

    String? imageUrl;

    if (removeProfileImage) {
      await ref
          .read(imageUploadRepositoryProvider)
          .deleteProfileImage(user.uid);
      imageUrl = null;
    } else if (profileImageBytes != null) {
      imageUrl = await uploadUserProfileImage(profileImageBytes, user.uid);
    }

    await ref
        .read(userRepositoryProvider)
        .updateUserProfile(
          uid: user.uid,
          name: name,
          removeProfileImage: removeProfileImage,
          profilePicUrl: imageUrl,
          location: location,
        );
  }

  Future<void> deleteAccount() async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotAuthenticatedException();
    }
    await ref.read(authRepositoryProvider).deleteAccount();
  }
}

@riverpod
AuthService authService(Ref ref) {
  return AuthService(ref);
}
