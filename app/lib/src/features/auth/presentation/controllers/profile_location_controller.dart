
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:app/src/features/startup/data/real/geolocator_repository.dart';

part 'profile_location_controller.g.dart';

@riverpod
class ProfileLocationController extends _$ProfileLocationController {
  @override
  FutureOr<LatLng?> build() {
    return _fetchInitialLocation();
  }

  Future<LatLng?> _fetchInitialLocation() async {
    final authRepo = ref.read(authRepositoryProvider);
    final user = authRepo.currentUser;

    if (user != null) {
      final userRepo = ref.read(userRepositoryProvider);
      final profile = await userRepo.fetchUserById(user.uid);
      if (profile?.lastLocation != null) {
        return profile!.lastLocation;
      }
    }

    final locationRepo = ref.read(userLocationRepositoryProvider);
    final sharedPrefsLocation = await locationRepo.fetchUserLocation();
    if (sharedPrefsLocation != null) {
      return sharedPrefsLocation;
    }

    return ref.read(defaultLocationProvider);
  }

  Future<void> saveLocation(LatLng location) async {
    final authRepo = ref.read(authRepositoryProvider);
    final user = authRepo.currentUser;

    if (user != null) {
      final userRepo = ref.read(userRepositoryProvider);
      await userRepo.updateUserProfile(uid: user.uid, location: location);
    }

    final locationRepo = ref.read(userLocationRepositoryProvider);
    await locationRepo.setUserLocation(location);
    
    state = AsyncData(location);
  }

  Future<LatLng?> getCurrentLocation() async {
    final locationRepo = ref.read(geoLocatorRepositoryProvider);
    final location = await locationRepo.getCurrentLocation();
    if (location != null) {
      state = AsyncData(location);
    }
    return location;
  }

  void updateLocation(LatLng location) {
    state = AsyncData(location);
  }
}
