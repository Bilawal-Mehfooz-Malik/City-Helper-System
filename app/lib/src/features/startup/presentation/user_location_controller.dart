import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exceptions/app_exceptions.dart';

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
          LocationServicesNotEnabledException().code,
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
          LocationPermissionDeniedException(),
          StackTrace.current,
        );
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        state = AsyncError(
          LocationPermissionDeniedForeverException().code,
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
