import 'package:app/src/core/exceptions/app_exceptions.dart';
import 'package:app/src/features/startup/domain/user_location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geolocator_repository.g.dart';

class GeoLocatorRepository {
  GeoLocatorRepository(this.geolocator);

  final GeolocatorPlatform geolocator;

  Future<UserLocation?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationServicesNotEnabledException();
    }

    // Check and request location permissions
    permission = await geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw LocationPermissionDeniedException();
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionDeniedForeverException();
    }

    // Permissions are granted, get the current location
    final res = await geolocator.getCurrentPosition();
    return UserLocation(latitude: res.latitude, longitude: res.longitude);
  }
}

@riverpod
GeoLocatorRepository geoLocatorRepository(Ref ref) {
  return GeoLocatorRepository(GeolocatorPlatform.instance);
}
