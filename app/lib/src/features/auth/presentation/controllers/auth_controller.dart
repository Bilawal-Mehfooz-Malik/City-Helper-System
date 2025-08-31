import 'dart:typed_data';

import 'package:app/src/features/auth/application/auth_service.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/domain/auth_exceptions.dart';
import 'package:app/src/features/auth/presentation/controllers/verification_id_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<void> build() async {}

  AuthRepository get _authRepo => ref.read(authRepositoryProvider);
  AuthService get _authService => ref.read(authServiceProvider);

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signOut());
  }

  // ------------------ OTP FLOW ------------------

  Future<AsyncValue<void>> sendOtp(String phoneNumber) async {
    String? verificationId;
    state = const AsyncLoading();

    final result = await AsyncValue.guard(() async {
      verificationId = await _authRepo.sendOtp(phoneNumber);
    });

    if (!result.hasError && verificationId != null) {
      ref.read(verificationIdControllerProvider.notifier).set(verificationId);
    } else {
      ref.read(verificationIdControllerProvider.notifier).clear();
    }

    state = result;
    return result;
  }

  Future<AsyncValue<void>> verifyOtp({required String code}) async {
    state = const AsyncLoading();
    final verificationId = ref.read(verificationIdControllerProvider);

    if (verificationId == null) {
      state = AsyncError(VerificationIdMissingException(), StackTrace.current);
      return state;
    }

    final result = await AsyncValue.guard(
      () => _authRepo.verifyOtp(smsCode: code, verificationId: verificationId),
    );

    state = result;
    return result;
  }

  // ------------------ USER CREATION ------------------

  Future<AsyncValue<void>> createUser({
    required String name,
    Uint8List? profileImageBytes,
    LatLng? location,
  }) async {
    state = const AsyncLoading();

    final result = await AsyncValue.guard(() async {
      await _authService.createUserProfile(
        name: name,
        profileImageBytes: profileImageBytes,
        location: location,
      );
    });

    state = result;
    return result;
  }

  // ------------------ USER UPDATE ------------------
  Future<AsyncValue<void>> updateUser({
    required String name,
    Uint8List? profileImageBytes,
    bool removeProfileImage = false,
    LatLng? location,
  }) async {
    state = const AsyncLoading();

    final result = await AsyncValue.guard(() async {
      final user = _authRepo.currentUser;
      if (user == null) throw UserNotAuthenticatedException();

      await _authService.updateUserProfile(
        name: name,
        profileImageBytes: profileImageBytes,
        location: location,
        removeProfileImage: removeProfileImage,
      );
    });

    state = result;
    return result;
  }
}
