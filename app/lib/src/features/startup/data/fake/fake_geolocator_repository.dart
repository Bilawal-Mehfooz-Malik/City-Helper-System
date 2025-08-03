import 'dart:async';
import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
import 'package:app/src/features/startup/domain/location_exceptions.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FakeGeoLocatorRepository implements GeoLocatorRepository {
  final bool locationServiceEnabled;
  final LocationPermission permission;
  final bool throwError;
  final LatLng? latLng;

  FakeGeoLocatorRepository({
    this.locationServiceEnabled = true,
    this.permission = LocationPermission.always,
    this.throwError = false,
    this.latLng,
  });

  @override
  Future<LatLng?> getCurrentLocation() async {
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

    // Only return LatLng if no exceptions were thrown
    return latLng ?? LatLng(33.150691628036256, 73.74845167724608);
  }
}
