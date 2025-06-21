import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/auth/domain/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  /// Sends an OTP to the given phone number.
  Future<void> sendOtp(String phoneNumber) {
    throw UnimplementedError();
  }

  /// Verifies the OTP entered by the user and signs them in.
  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) {
    throw UnimplementedError();
  }

  /// Signs out the currently logged-in user.
  Future<void> signOut() {
    throw UnimplementedError();
  }

  Future<AppUser?> getUserById(UserId userId) {
    throw UnimplementedError();
  }

  /// Uploads the user profile info like name and profile picture.
  Future<void> updateUserProfile({
    required String name,
    String? profilePicUrl,
  }) {
    throw UnimplementedError();
  }

  Future<void> editUserProfile({
    required String name,
    String? profilePicUrl,
  }) async {
    throw UnimplementedError();
  }

  /// Updates the user's current location (LatLng).
  Future<void> updateUserLocation(LatLng location) {
    throw UnimplementedError();
  }

  /// Notifies about changes to the user's sign-in state (such as sign-in or
  /// sign-out).
  Stream<AppUser?> authStateChanges() {
    throw UnimplementedError();
  }

  /// Notifies about changes to the user's sign-in state (such as sign-in or
  /// sign-out) and also token refresh events.
  Stream<AppUser?> idTokenChanges() {
    throw UnimplementedError();
  }

  AppUser? get currentUser => throw UnimplementedError();
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}

// * Using keepAlive since other providers need it to be an
// * [AlwaysAliveProviderListenable]
@Riverpod(keepAlive: true)
Stream<AppUser?> authStateChanges(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
}

@Riverpod(keepAlive: true)
Stream<AppUser?> idTokenChanges(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.idTokenChanges();
}

@riverpod
Future<AppUser?> getUserById(Ref ref, String userId) {
  final userRepository = ref.watch(authRepositoryProvider);
  return userRepository.getUserById(userId);
}
