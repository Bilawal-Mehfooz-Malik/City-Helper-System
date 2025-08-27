import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/auth/data/fake/test_users.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:app/src/features/auth/domain/app_user.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FakeUserRepository implements UserRepository {
  FakeUserRepository({this.addDelay = true});
  final bool addDelay;

  final _users = InMemoryStore<List<AppUser>>(List.from(testUsers));

  @override
  Future<void> createUserProfile({required AppUser user}) async {
    await delay(addDelay);
    final current = _users.value;
    final index = current.indexWhere((u) => u.uid == user.uid);
    if (index != -1) {
      current[index] = user;
    } else {
      current.add(user);
    }
    _users.value = [...current];
  }

  @override
  Stream<AppUser?> getUserById(String uid) {
    // This is a Stream method, but for fake, we can just return a single value stream
    return _users.stream.map(
      (users) => users.firstWhereOrNull((user) => user.uid == uid),
    );
  }

  @override
  Future<void> updateUserProfile({
    required String uid,
    String? name,
    String? profilePicUrl,
    LatLng? location,
    bool removeProfileImage = false,
  }) async {
    await delay(addDelay);
    final current = _users.value;
    final index = current.indexWhere((u) => u.uid == uid);
    if (index != -1) {
      final user = current[index];
      final updatedUser = user.copyWith(
        name: name ?? user.name,
        profileImageUrl: removeProfileImage
            ? null
            : profilePicUrl ?? user.profileImageUrl,
        lastLocation: location ?? user.lastLocation,
      );
      current[index] = updatedUser;
      _users.value = [...current];
    }
  }

  @override
  Future<AppUser?> fetchUserById(String uid) async {
    await delay(addDelay);
    final users = _users.value;
    return users.firstWhereOrNull((user) => user.uid == uid);
  }

  @override
  Future<void> updateUser(AppUser user) async {
    await delay(addDelay);
    final current = _users.value;
    final index = current.indexWhere((u) => u.uid == user.uid);
    if (index != -1) {
      current[index] = user;
      _users.value = [...current];
    } else {
      current.add(user);
      _users.value = [...current];
    }
  }
}
