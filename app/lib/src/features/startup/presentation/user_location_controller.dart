import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../localization/string_hardcoded.dart';

part 'user_location_controller.g.dart';

@riverpod
class UserLocationController extends _$UserLocationController {
  @override
  FutureOr<LatLng?> build() {
    return null;
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    state = const AsyncLoading();

    try {
      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      debugPrint(serviceEnabled.toString());
      if (!serviceEnabled) {
        state = AsyncError(
          'Location-Services-Not-Enabled'.hardcoded,
          StackTrace.current,
        );
        return;
      }

      // Check and request location permissions
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        state = AsyncError(
          'Location Permission Denied. Please click on allow button to continue.'
              .hardcoded,
          StackTrace.current,
        );
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        state = AsyncError(
          'Location-Permission-Denied-Forever'.hardcoded,
          StackTrace.current,
        );
        return;
      }

      // Permissions are granted, get the current location
      final res = await Geolocator.getCurrentPosition();
      state = AsyncData(LatLng(res.latitude, res.longitude));
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void getLocationFromMap(LatLng latLng) {
    state = const AsyncData(null);
    state = const AsyncLoading();
    state = AsyncData(latLng);
  }
}
