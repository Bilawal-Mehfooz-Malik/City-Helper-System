import 'dart:async';

import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/features/auth/domain/app_user.dart';
import 'package:app/src/features/auth/domain/auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository(this._auth);

  ConfirmationResult? _confirmationResult; // Used only for web

  /// Sends OTP to the given phone number.
  /// Returns verificationId for mobile; empty string for web.
  Future<String> sendOtp(String phoneNumber) async {
    if (kIsWeb) {
      _confirmationResult = await _auth.signInWithPhoneNumber(phoneNumber);
      return ''; // Web does not expose verificationId
    } else {
      final completer = Completer<String>();

      try {
        await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 60),
          verificationCompleted: (_) {},
          verificationFailed: (e) {
            if (!completer.isCompleted) {
              completer.completeError(e);
            }
          },
          codeSent: (verificationId, _) {
            if (!completer.isCompleted) {
              completer.complete(verificationId);
            }
          },
          codeAutoRetrievalTimeout: (verificationId) {
            if (!completer.isCompleted) {
              completer.complete(verificationId);
            }
          },
        );
      } catch (e) {
        if (!completer.isCompleted) {
          completer.completeError(e);
        }
      }

      return completer.future;
    }
  }

  /// Verifies OTP and signs in the user.
  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    if (kIsWeb) {
      if (_confirmationResult == null) {
        AppLogger.logError(
          'Confirmation result is null. Did you call sendOtp first?',
          stackTrace: StackTrace.current,
        );
        throw UserCreationException();
      }
      await _confirmationResult!.confirm(smsCode);
    } else {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
    }
  }

  /// Current signed-in user as domain model.
  AppUser? get currentUser => _convertUser(_auth.currentUser);

  /// Stream of authentication state changes mapped to AppUser.
  Stream<AppUser?> authStateChanges() {
    return _auth.authStateChanges().map(_convertUser);
  }

  /// Stream of ID token changes mapped to AppUser.
  Stream<AppUser?> idTokenChanges() {
    return _auth.idTokenChanges().map(_convertUser);
  }

  /// Signs out the current user.
  Future<void> signOut() {
    return _auth.signOut();
  }

  /// Converts Firebase [User] to your app domain [AppUser].
  AppUser? _convertUser(User? user) => user != null
      ? AppUser(
          uid: user.uid,
          phoneNumber: user.phoneNumber ?? '',
          name: user.displayName ?? '',
        )
      : null;
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository(FirebaseAuth.instance);
}

@Riverpod(keepAlive: true)
Stream<AppUser?> authStateChanges(Ref ref) {
  return ref.read(authRepositoryProvider).authStateChanges();
}

@Riverpod(keepAlive: true)
Stream<AppUser?> idTokenChanges(Ref ref) {
  return ref.read(authRepositoryProvider).idTokenChanges();
}
