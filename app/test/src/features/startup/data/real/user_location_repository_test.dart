import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app/src/features/startup/data/real/user_location_repository.dart';

void main() {
  late UserLocationRepository userLocationRepository;
  late SharedPreferences sharedPreferences;

  const testLocation1 = LatLng(11.0, 11.0);
  const testLocation2 = LatLng(40.7128, -74.0060);

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    userLocationRepository = UserLocationRepository(sharedPreferences, timeOut: 15);
  });

  group('setUserLocation', () {
    test('successfully saves valid location', () async {
      // run
      await userLocationRepository.setUserLocation(testLocation1);
      final stored = await userLocationRepository.fetchUserLocation();

      // verify
      expect(stored, equals(testLocation1));
    });

    test('handles concurrent write operations', () async {
      // run
      await Future.wait([
        userLocationRepository.setUserLocation(testLocation1),
        userLocationRepository.setUserLocation(testLocation2),
      ]);

      // verify
      final stored = await userLocationRepository.fetchUserLocation();
      expect(stored, equals(testLocation2));
    });
  });

  test('fetchUserLocation returns null if no data is stored', () async {
    // run
    final userLocation = await userLocationRepository.fetchUserLocation();

    // verify
    expect(userLocation, isNull);
  });

  test(
    'setUserLocation sets testLatLng and then fetchUserLocation returns testLatLng',
    () async {
      // setup
      await userLocationRepository.setUserLocation(testLocation1);

      // run
      final latLng = await userLocationRepository.fetchUserLocation();

      // verify
      expect(latLng, testLocation1);
    },
  );
}