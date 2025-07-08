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

  Stream<AppUser?> getUserById(String uid) {
    return _firestore.collection(usersCollection).doc(uid).snapshots().map((
      doc,
    ) {
      if (doc.exists && doc.data() != null) {
        return AppUser.fromJson(doc.data()!);
      } else {
        return null;
      }
    });
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

  Future<AppUser?> fetchUserById(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) return null;
    final data = doc.data()!;
    return AppUser.fromJson(data);
  }

  Future<void> updateUser(AppUser user) {
    return _firestore
        .collection(usersCollection)
        .doc(user.uid)
        .set(user.toJson());
  }
}

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<AppUser?> getUserById(Ref ref, String uid) {
  return ref.read(userRepositoryProvider).getUserById(uid);
}
