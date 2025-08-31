import 'dart:typed_data';

import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/auth/application/auth_service.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/data/image_upload_repository.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:app/src/features/auth/domain/app_user.dart';
import 'package:app/src/features/auth/domain/auth_exceptions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeAuthService extends AuthService {
  FakeAuthService({
    required this.authRepository,
    required this.userRepository,
    required this.imageUploadRepository,
    required this.defaultLocation,
  }) : super(FakeRef());

  final AuthRepository authRepository;
  final UserRepository userRepository;
  final ImageUploadRepository imageUploadRepository;
  final LatLng defaultLocation;

  @override
  Future<String> uploadUserProfileImage(
    Uint8List imageBytes,
    UserId userId,
  ) async {
    try {
      return await imageUploadRepository.uploadUserProfileImage(
        imageBytes: imageBytes,
        userId: userId,
      );
    } catch (e, st) {
      AppLogger.logError(
        'Failed to upload profile image for user $userId',
        error: e,
        stackTrace: st,
      );
      throw UserProfileImageUpdateException();
    }
  }

  @override
  Future<void> createUserProfile({
    required String name,
    Uint8List? profileImageBytes,
    LatLng? location,
  }) async {
    final user = authRepository.currentUser;
    if (user == null) throw UserNotAuthenticatedException();

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

    await userRepository.createUserProfile(user: appUser);
  }

  @override
  Future<void> updateUserProfile({
    String? name,
    Uint8List? profileImageBytes,
    LatLng? location,
    bool removeProfileImage = false,
  }) async {
    final user = authRepository.currentUser;
    if (user == null) throw UserNotAuthenticatedException();

    String? imageUrl;

    if (removeProfileImage) {
      await imageUploadRepository.deleteProfileImage(user.uid);
    } else if (profileImageBytes != null) {
      imageUrl = await uploadUserProfileImage(profileImageBytes, user.uid);
    }

    await userRepository.updateUserProfile(
      uid: user.uid,
      name: name,
      profilePicUrl: imageUrl,
      location: location,
      removeProfileImage: removeProfileImage,
    );
  }
}

class FakeRef implements Ref {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
