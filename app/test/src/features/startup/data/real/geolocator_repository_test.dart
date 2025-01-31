import 'package:app/src/core/exceptions/app_exceptions.dart';
import 'package:app/src/features/startup/domain/location_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app/src/features/startup/data/real/geolocator_repository.dart';

import '../../../../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GeolocatorPlatform geoLocator;
  late GeoLocatorRepository locationRepository;

  const latitude = 37.0;
  const longitude = -122.0;
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
    locationRepository = GeoLocatorRepository(geoLocator, timeOut: 15);
  });

  group('GeoLocationRepository', () {
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
      expect(result!.latitude, position.latitude);
      expect(result.longitude, position.longitude);
    });

    test('getCurrentLocation returns throws LocationFetchFailedException',
        () async {
      // Setup
      when(() => geoLocator.isLocationServiceEnabled())
          .thenAnswer((_) async => true);
      when(() => geoLocator.checkPermission())
          .thenAnswer((_) async => LocationPermission.whileInUse);
      when(() => geoLocator.getCurrentPosition())
          .thenThrow(LocationFetchFailedException());

      // Run
      expect(
        locationRepository.getCurrentLocation(),
        throwsA(isA<LocationFetchFailedException>()),
      );
    });

    test('throws LocationServicesDisabledException when services are disabled',
        () async {
      // Setup
      when(() => geoLocator.isLocationServiceEnabled())
          .thenAnswer((_) async => false);

      // Running & Verify
      expect(
        locationRepository.getCurrentLocation(),
        throwsA(isA<LocationServicesDisabledException>()),
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

    test(
        'throws LocationFetchFailedException when it fails in fetching location',
        () async {
      // Setup
      when(() => geoLocator.isLocationServiceEnabled())
          .thenAnswer((_) async => true);
      when(() => geoLocator.checkPermission())
          .thenAnswer((_) async => LocationPermission.whileInUse);
      when(() => geoLocator.getCurrentPosition())
          .thenThrow(LocationFetchFailedException());

      // Running & Verify
      expect(
        locationRepository.getCurrentLocation(),
        throwsA(isA<LocationFetchFailedException>()),
      );
    });

    test('throws TimedOutException when request takes longer time', () async {
      // Setup
      final geoLocatorPlatform = MockGeoLocator();
      final repo = GeoLocatorRepository(geoLocatorPlatform, timeOut: 1);
      when(() => geoLocatorPlatform.isLocationServiceEnabled()).thenAnswer(
          (_) => Future.delayed(const Duration(seconds: 2), () => false));

      // Running & Verify
      expect(repo.getCurrentLocation(), throwsA(isA<TimedOutException>()));
    });
  });
}
