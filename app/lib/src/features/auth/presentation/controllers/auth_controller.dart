import 'dart:typed_data';

import 'package:app/src/features/auth/application/auth_service.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:app/src/features/auth/domain/auth_exceptions.dart';
import 'package:app/src/features/auth/presentation/controllers/verification_id_controller.dart';
import 'package:app/src/features/my_shop/data/user_mode_repository.dart';
import 'package:app/src/routers/app_router.dart';
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
    state = const AsyncLoading();
    try {
      await _authRepo.signOut();
      ref.read(userModeRepositoryProvider).setIsAdminMode(false);
      ref.read(appRouterProvider).pop();
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteAccount() async {
    state = const AsyncLoading();
    try {
      await _authService.deleteAccount();
      await signOut();
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
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

  Future<AsyncValue<void>> verifyOtpAndCheckProfile({
    required String code,
  }) async {
    state = const AsyncLoading();
    final verificationId = ref.read(verificationIdControllerProvider);

    if (verificationId == null) {
      state = AsyncError(VerificationIdMissingException(), StackTrace.current);
      return state;
    }

    final result = await AsyncValue.guard(
      () => _authRepo.verifyOtp(smsCode: code, verificationId: verificationId),
    );

    if (result.hasError) {
      state = result;
      return result;
    }

    final user = _authRepo.currentUser;
    if (user == null) {
      state = result;
      return result;
    }

    final userProfile = await ref.read(fetchUserByIdProvider(user.uid).future);
    final router = ref.read(appRouterProvider);

    if (userProfile == null) {
      router.goNamed(AppRoute.profile.name);
    } else {
      router.pop();
    }

    state = result;
    return result;
  }

  // ------------------ USER CREATION ------------------

  Future<AsyncValue<void>> createUser({
    required String name,
    Uint8List? profileImageBytes,
    LatLng? location,
  }) async {
    state = const AsyncLoading(); // Set to loading state immediately

    try {
      await _authService.createUserProfile(
        name: name,
        profileImageBytes: profileImageBytes,
        location: location,
      );
      state = const AsyncData(null); // Set to data state on success
      return const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st); // Set to error state on failure
      return AsyncError(e, st);
    }
  }

  // ------------------ USER UPDATE ------------------
  Future<AsyncValue<void>> updateUser({
    required String name,
    Uint8List? profileImageBytes,
    bool removeProfileImage = false,
    LatLng? location,
  }) async {
    state = const AsyncLoading(); // Set to loading state immediately

    try {
      final user = _authRepo.currentUser;
      if (user == null) throw UserNotAuthenticatedException();

      await _authService.updateUserProfile(
        name: name,
        profileImageBytes: profileImageBytes,
        location: location,
        removeProfileImage: removeProfileImage,
      );
      state = const AsyncData(null); // Set to data state on success
      return const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st); // Set to error state on failure
      return AsyncError(e, st);
    }
  }
}
