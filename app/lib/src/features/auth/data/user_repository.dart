import 'package:app/src/features/auth/domain/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

class UserRepository {
  final FirebaseFirestore _firestore;

  static const String usersCollection = 'users';

  UserRepository(this._firestore);

  Future<void> createUserProfile({required AppUser user}) async {
    await _firestore
        .collection(usersCollection)
        .doc(user.uid)
        .set(user.toJson());
  }

  Future<AppUser?> getUserById(String uid) async {
    final doc = await _firestore.collection(usersCollection).doc(uid).get();
    if (doc.exists) {
      return AppUser.fromJson(doc.data()!);
    } else {
      return null;
    }
  }

  Future<void> updateUserProfile({
    required String uid,
    String? name,
    String? profilePicUrl,
    LatLng? location,
    bool removeProfileImage = false,
  }) async {
    final data = <String, Object?>{};

    if (name != null) data['name'] = name;
    if (removeProfileImage) {
      data['profileImageUrl'] = null;
    } else if (profilePicUrl != null) {
      data['profileImageUrl'] = profilePicUrl;
    }

    if (location != null) {
      data['lastLocation'] = location;
    }

    if (data.isNotEmpty) {
      await _firestore.collection(usersCollection).doc(uid).update(data);
    }
  }
}

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepository(FirebaseFirestore.instance);
}

@riverpod
Future<AppUser?> getUserById(Ref ref, String uid) {
  return ref.read(userRepositoryProvider).getUserById(uid);
}
