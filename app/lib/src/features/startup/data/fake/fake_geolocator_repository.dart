import 'dart:async';
import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
import 'package:app/src/features/startup/domain/location_exceptions.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:geolocator/geolocator.dart';

class FakeGeoLocatorRepository implements GeoLocatorRepository {
  final bool locationServiceEnabled;
  final LocationPermission permission;
  final bool throwError;
  final GeoLocation? mockLocation;

  FakeGeoLocatorRepository({
    this.locationServiceEnabled = true,
    this.permission = LocationPermission.always,
    this.throwError = false,
    this.mockLocation,
  });

  @override
  Future<GeoLocation?> getCurrentLocation() async {
    if (!locationServiceEnabled) {
      throw LocationServicesDisabledException();
    }

    if (permission == LocationPermission.denied) {
      throw LocationPermissionDeniedException();
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionDeniedForeverException();
    }

    if (throwError) {
      throw LocationFetchFailedException();
    }

    return mockLocation ??
        const GeoLocation(
            latitude: 33.150691628036256, longitude: 73.74845167724608);
  }
}
