import 'dart:async';

import 'package:app/src/core/utils/city_country_name_getter.dart';
import 'package:app/src/features/pick_location/data/real/geolocator_repository.dart';
import 'package:app/src/features/pick_location/data/real/user_location_repository.dart';
import 'package:app/src/features/pick_location/domain/coordinates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class PickLocationController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() => null;

  Future<LatLng?> getCurrentLocation() async {
    state = AsyncLoading();
    final repo = ref.read(geoLocatorRepositoryProvider);
    try {
      final loc = await repo.getCurrentLocation();
      state = AsyncData(null);
      return loc;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  Future<void> saveUserLocation(Coordinates coordinates) async {
    state = AsyncLoading();
    try {
      final location = await getCityAndCountry(coordinates);
      final repo = ref.read(userLocationRepositoryProvider);
      await repo.saveUserLocation(location);
      ref.invalidate(fetchUserLocationProvider);
      state = AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

final pickLocationControllerProvider =
    AsyncNotifierProvider<PickLocationController, void>(
      PickLocationController.new,
    );
