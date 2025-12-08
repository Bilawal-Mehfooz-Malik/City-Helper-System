import 'dart:async';
import 'dart:convert';

import 'package:app/src/core/exceptions/app_exceptions.dart';
import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/features/startup/domain/user_location.dart';
import 'package:app/src/features/startup/domain/user_location_exceptions.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocationRepository {
  UserLocationRepository(this._sharedPreferences, {int timeOut = 30})
    : _timeOut = timeOut;

  final int _timeOut;
  final SharedPreferences _sharedPreferences;

  static const String userLocationKey = 'userLocation';

  /// Save UserLocation
  Future<void> saveUserLocation(UserLocation location) async {
    await checkTimeOut(_timeOut, () async {
      final jsonString = jsonEncode(location.toJson());
      await _sharedPreferences.setString(userLocationKey, jsonString);
    });
  }

  /// Fetch UserLocation
  Future<UserLocation?> fetchUserLocation() async {
    final message =
        'Local data corrupted. Cleared invalid stored location.'.hardcoded;
    try {
      return checkTimeOut(_timeOut, () async {
        final jsonString = _sharedPreferences.getString(userLocationKey);

        if (jsonString == null) {
          return null;
        }

        try {
          final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
          return UserLocation.fromJson(jsonMap);
        } catch (e) {
          // Data is corrupted or unreadable
          await clearUserLocation();
          throw FailedtoFetchUserLocationException(message);
        }
      });
    } catch (e, s) {
      AppLogger.logError(message, error: e, stackTrace: s);
      if (e is AppException) rethrow;
      throw FailedtoFetchUserLocationException(e.toString());
    }
  }

  /// Clear stored location
  Future<void> clearUserLocation() async {
    await _sharedPreferences.remove(userLocationKey);
  }
}

/// Provider for UserLocationRepository
final userLocationRepositoryProvider = Provider<UserLocationRepository>(
  (ref) => throw UnimplementedError(),
);

/// FutureProvider to fetch user location
final fetchUserLocationProvider = FutureProvider<UserLocation?>((ref) async {
  final locationRepo = ref.watch(userLocationRepositoryProvider);
  return locationRepo.fetchUserLocation();
});
