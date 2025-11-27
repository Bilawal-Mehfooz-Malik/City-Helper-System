import 'dart:async';
import 'dart:convert';

import 'package:app/src/core/utils/delay.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_location_repository.g.dart';

class UserLocationRepository {
  UserLocationRepository(this._sharedPreferences, {int timeOut = 30})
    : _timeOut = timeOut;

  final int _timeOut;
  final SharedPreferences _sharedPreferences;

  static const String userLocationKey = 'userLocation';

  Future<void> setUserLocation(LatLng latLng) async {
    await checkTimeOut(_timeOut, () async {
      await _sharedPreferences.setString(
        userLocationKey,
        json.encode(latLng.toJson()),
      );
    });
  }

  Future<LatLng?> fetchUserLocation() async {
    return checkTimeOut(_timeOut, () async {
      final jsonString = _sharedPreferences.getString(userLocationKey);
      if (jsonString != null) {
        return LatLng.fromJson(json.decode(jsonString));
      }
      return null;
    });
  }
}

@Riverpod(keepAlive: true)
UserLocationRepository userLocationRepository(Ref ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
Future<LatLng?> fetchUserLocation(Ref ref) {
  final locationRepo = ref.watch(userLocationRepositoryProvider);
  return locationRepo.fetchUserLocation();
}
