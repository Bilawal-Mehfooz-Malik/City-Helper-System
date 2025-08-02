import 'dart:convert';

import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('UserLocationRepository', () {
    late MockSharedPreferences mockSharedPreferences;
    late UserLocationRepository userLocationRepository;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      userLocationRepository = UserLocationRepository(mockSharedPreferences);
    });

    test('setUserLocation saves LatLng to SharedPreferences', () async {
      const latLng = LatLng(34.0522, -118.2437);
      when(
        () => mockSharedPreferences.setString(
          UserLocationRepository.userLocationKey,
          json.encode(latLng.toJson()),
        ),
      ).thenAnswer((_) async => true);

      await userLocationRepository.setUserLocation(latLng);

      verify(
        () => mockSharedPreferences.setString(
          UserLocationRepository.userLocationKey,
          json.encode(latLng.toJson()),
        ),
      ).called(1);
    });

    test('fetchUserLocation returns LatLng if data exists', () async {
      const latLng = LatLng(34.0522, -118.2437);
      when(
        () => mockSharedPreferences.getString(
          UserLocationRepository.userLocationKey,
        ),
      ).thenAnswer((_) => json.encode(latLng.toJson()));

      final result = await userLocationRepository.fetchUserLocation();

      expect(result, latLng);
      verify(
        () => mockSharedPreferences.getString(
          UserLocationRepository.userLocationKey,
        ),
      ).called(1);
    });

    test('fetchUserLocation returns null if no data exists', () async {
      when(
        () => mockSharedPreferences.getString(
          UserLocationRepository.userLocationKey,
        ),
      ).thenAnswer((_) => null);

      final result = await userLocationRepository.fetchUserLocation();

      expect(result, isNull);
      verify(
        () => mockSharedPreferences.getString(
          UserLocationRepository.userLocationKey,
        ),
      ).called(1);
    });
  });
}
