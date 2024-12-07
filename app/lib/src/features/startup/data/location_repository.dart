import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exceptions/app_exceptions.dart';

part 'location_repository.g.dart';

class LocationRepository {
  LocationRepository(this.geolocator);

  final GeolocatorPlatform geolocator;

  Future<LatLng> getCurrentLocation() async {
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
    return LatLng(res.latitude, res.longitude);
  }

  LatLng getLocationFromMap(LatLng latLng) {
    return latLng;
  }
}

@riverpod
LocationRepository locationRepository(Ref ref) {
  return LocationRepository(GeolocatorPlatform.instance);
}
