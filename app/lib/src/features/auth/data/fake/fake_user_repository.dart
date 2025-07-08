import 'dart:async';

import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:app/src/features/auth/domain/app_user.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FakeUserRepository implements UserRepository {
  FakeUserRepository({this.addDelay = true});

  final Map<String, AppUser> _userStore = {};
  final Map<String, Stream<AppUser?>> _userStreams = {};
  final Map<String, StreamController<AppUser?>> _controllers = {};
  final bool addDelay;

  /// Simulate creating a user document
  @override
  Future<void> createUserProfile({required AppUser user}) async {
    await delay(addDelay);
    _userStore[user.uid] = user;
    _controllers[user.uid]?.add(user);
  }

  /// Simulate reading user document as stream
  @override
  Stream<AppUser?> getUserById(String uid) {
    if (!_controllers.containsKey(uid)) {
      final controller = StreamController<AppUser?>.broadcast();
      controller.add(_userStore[uid]);
      _controllers[uid] = controller;
      _userStreams[uid] = controller.stream;
    }
    return _userStreams[uid]!;
  }

  /// Simulate updating a user document
  @override
  Future<void> updateUserProfile({
    required String uid,
    String? name,
    String? profilePicUrl,
    LatLng? location,
    bool removeProfileImage = false,
  }) async {
    await delay(addDelay);
    final existing = _userStore[uid];
    if (existing == null) return;

    final updated = existing.copyWith(
      name: name ?? existing.name,
      profileImageUrl: removeProfileImage
          ? null
          : (profilePicUrl ?? existing.profileImageUrl),
      lastLocation: location ?? existing.lastLocation,
    );

    _userStore[uid] = updated;
    _controllers[uid]?.add(updated);
  }

  /// Dispose all streams (optional for tests)
  void dispose() {
    for (final controller in _controllers.values) {
      controller.close();
    }
  }

  @override
  Future<AppUser?> fetchUserById(String uid) {
    // TODO: implement fetchUserById
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(AppUser user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
