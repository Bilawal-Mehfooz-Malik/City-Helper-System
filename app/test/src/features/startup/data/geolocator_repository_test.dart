import 'package:app/src/features/startup/domain/user_location.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app/src/core/exceptions/app_exceptions.dart';
import 'package:app/src/features/startup/data/geolocator_repository.dart';

import '../../../mocks.dart';

void main() {
  late MockGeoLocator geoLocator;
  late GeoLocatorRepository locationRepository;

  const latitude = 37.0;
  const longitude = -122.0;
  const testLatLng = UserLocation(latitude: latitude, longitude: longitude);
  final position = Position(
    latitude: latitude,
    longitude: longitude,
    timestamp: DateTime(2025),
    accuracy: 1.0,
    altitude: 1.0,
    heading: 1.0,
    speed: 1.0,
    speedAccuracy: 1.0,
    altitudeAccuracy: 12,
    headingAccuracy: 12,
  );

  setUp(() {
    geoLocator = MockGeoLocator();
    locationRepository = GeoLocatorRepository(geoLocator);
  });

  group('LocationRepository', () {
    test('getCurrentLocation returns user location', () async {
      // Setup
      when(() => geoLocator.isLocationServiceEnabled())
          .thenAnswer((_) async => true);
      when(() => geoLocator.checkPermission())
          .thenAnswer((_) async => LocationPermission.whileInUse);
      when(() => geoLocator.getCurrentPosition())
          .thenAnswer((_) async => position);

      // Run
      final result = await locationRepository.getCurrentLocation();

      // Verify
      expect(result, testLatLng);
    });

    test(
        'throws LocationServicesNotEnabledException when services are disabled',
        () async {
      // Setup
      when(() => geoLocator.isLocationServiceEnabled())
          .thenAnswer((_) async => false);

      // Running & Verify
      expect(
        locationRepository.getCurrentLocation(),
        throwsA(isA<LocationServicesNotEnabledException>()),
      );
    });

    test('throws LocationPermissionDeniedException when permissions are denied',
        () async {
      // Setup
      when(() => geoLocator.isLocationServiceEnabled())
          .thenAnswer((_) async => true);
      when(() => geoLocator.checkPermission())
          .thenAnswer((_) async => LocationPermission.denied);
      when(() => geoLocator.requestPermission())
          .thenAnswer((_) async => LocationPermission.denied);

      // Running & Verify
      expect(
        locationRepository.getCurrentLocation(),
        throwsA(isA<LocationPermissionDeniedException>()),
      );
    });

    test(
        'throws LocationPermissionDeniedForeverException when permissions are denied forever',
        () async {
      // Setup
      when(() => geoLocator.isLocationServiceEnabled())
          .thenAnswer((_) async => true);
      when(() => geoLocator.checkPermission())
          .thenAnswer((_) async => LocationPermission.deniedForever);

      // Running & Verify
      expect(
        locationRepository.getCurrentLocation(),
        throwsA(isA<LocationPermissionDeniedForeverException>()),
      );
    });
  });
}
