import 'dart:async';

import 'package:app/src/core/exceptions/app_exceptions.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/features/startup/domain/location_exceptions.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geolocator_repository.g.dart';

class GeoLocatorRepository {
  GeoLocatorRepository(this._geolocator, {int timeOut = 30})
      : _timeOut = timeOut;

  final GeolocatorPlatform _geolocator;
  final int _timeOut;

  Future<GeoLocation?> getCurrentLocation() {
    return checkTimeOut(_timeOut, () async {
      bool serviceEnabled;
      LocationPermission permission;

      // Check if location services are enabled
      serviceEnabled = await _geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw LocationServicesDisabledException();
      }

      // Check and request location permissions
      permission = await _geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await _geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        throw LocationPermissionDeniedException();
      }

      if (permission == LocationPermission.deniedForever) {
        throw LocationPermissionDeniedForeverException();
      }

      // Get current position
      try {
        final position = await _geolocator.getCurrentPosition();
        return GeoLocation(
          latitude: position.latitude,
          longitude: position.longitude,
        );
      } catch (e, s) {
        if (e is! AppException) {
          debugPrint('--- Location Fetch Exception ---\n'
              'Error: $e\n'
              'Stack Trace:\n$s\n'
              '------------------------------');
        }
        throw LocationFetchFailedException();
      }
    });
  }
}

@riverpod
GeoLocatorRepository geoLocatorRepository(Ref ref) {
  return GeoLocatorRepository(GeolocatorPlatform.instance);
}
