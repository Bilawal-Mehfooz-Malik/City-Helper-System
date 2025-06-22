import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/auth/domain/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  AuthRepository(this._auth, this._firestore);

  static const _usersCollection = 'users';

  Future<String> sendOtp(String phoneNumber) async {
    if (kIsWeb) {
      final confirmation = await _auth.signInWithPhoneNumber(phoneNumber);
      return confirmation.verificationId;
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

  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await _auth.signInWithCredential(credential);
  }

  Future<AppUser?> getUserById(UserId userId) async {
    final doc = await _firestore.collection(_usersCollection).doc(userId).get();
    return doc.exists ? AppUser.fromJson(doc.data()!) : null;
  }

  Future<void> updateUserProfile({
    required String name,
    String? profilePicUrl,
    LatLng? location,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;

    // Update Firebase Auth
    await user.updateDisplayName(name);
    if (profilePicUrl != null) await user.updatePhotoURL(profilePicUrl);

    // Prepare Firestore update
    final docRef = _firestore.collection(_usersCollection).doc(user.uid);
    final doc = await docRef.get();

    final userData = doc.exists
        ? AppUser.fromJson(doc.data()!).copyWith(
            name: name,
            profileImageUrl: profilePicUrl,
            lastLocation: location,
          )
        : AppUser(
            uid: user.uid,
            phoneNumber: user.phoneNumber ?? '',
            name: name,
            profileImageUrl: profilePicUrl,
            lastLocation: location,
          );

    await (doc.exists
        ? docRef.update(userData.toJson())
        : docRef.set(userData.toJson()));
  }

  Future<void> signOut() => _auth.signOut();

  Stream<AppUser?> authStateChanges() {
    return _auth.authStateChanges().asyncMap(_mapFirebaseUserToAppUser);
  }

  Stream<AppUser?> idTokenChanges() {
    return _auth.idTokenChanges().asyncMap(_mapFirebaseUserToAppUser);
  }

  Future<AppUser?> get currentUser {
    return _mapFirebaseUserToAppUser(_auth.currentUser);
  }

  Future<AppUser?> _mapFirebaseUserToAppUser(User? user) async {
    if (user == null) return null;
    final doc = await _firestore
        .collection(_usersCollection)
        .doc(user.uid)
        .get();
    return doc.exists ? AppUser.fromJson(doc.data()!) : null;
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository(FirebaseAuth.instance, FirebaseFirestore.instance);
}

@Riverpod(keepAlive: true)
Stream<AppUser?> authStateChanges(Ref ref) {
  return ref.read(authRepositoryProvider).authStateChanges();
}

@Riverpod(keepAlive: true)
Stream<AppUser?> idTokenChanges(Ref ref) {
  return ref.read(authRepositoryProvider).idTokenChanges();
}

@riverpod
Future<AppUser?> getUserById(Ref ref, String userId) {
  return ref.read(authRepositoryProvider).getUserById(userId);
}
