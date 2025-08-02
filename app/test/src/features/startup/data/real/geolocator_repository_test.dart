import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
import 'package:app/src/features/startup/domain/location_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

// Mock GeolocatorPlatform

void main() {
  group('GeoLocatorRepository', () {
    late MockGeolocatorPlatform mockGeolocatorPlatform;
    late GeoLocatorRepository geoLocatorRepository;

    setUp(() {
      mockGeolocatorPlatform = MockGeolocatorPlatform();
      // Register fallback values for LatLng and Position
      registerFallbackValue(const LatLng(0, 0));
      registerFallbackValue(
        Position(
          latitude: 0,
          longitude: 0,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0,
          altitudeAccuracy: 0,
          headingAccuracy: 0,
        ),
      );

      geoLocatorRepository = GeoLocatorRepository(mockGeolocatorPlatform);
    });

    test(
      'getCurrentLocation throws LocationServicesDisabledException if services are disabled',
      () async {
        when(
          () => mockGeolocatorPlatform.isLocationServiceEnabled(),
        ).thenAnswer((_) async => false);

        expect(
          () => geoLocatorRepository.getCurrentLocation(),
          throwsA(isA<LocationServicesDisabledException>()),
        );
      },
    );

    test(
      'getCurrentLocation throws LocationPermissionDeniedException if permission is denied',
      () async {
        when(
          () => mockGeolocatorPlatform.isLocationServiceEnabled(),
        ).thenAnswer((_) async => true);
        when(
          () => mockGeolocatorPlatform.checkPermission(),
        ).thenAnswer((_) async => LocationPermission.denied);
        when(
          () => mockGeolocatorPlatform.requestPermission(),
        ).thenAnswer((_) async => LocationPermission.denied);

        expect(
          () => geoLocatorRepository.getCurrentLocation(),
          throwsA(isA<LocationPermissionDeniedException>()),
        );
      },
    );

    test(
      'getCurrentLocation throws LocationPermissionDeniedForeverException if permission is denied forever',
      () async {
        when(
          () => mockGeolocatorPlatform.isLocationServiceEnabled(),
        ).thenAnswer((_) async => true);
        when(
          () => mockGeolocatorPlatform.checkPermission(),
        ).thenAnswer((_) async => LocationPermission.deniedForever);

        expect(
          () => geoLocatorRepository.getCurrentLocation(),
          throwsA(isA<LocationPermissionDeniedForeverException>()),
        );
      },
    );

    test(
      'getCurrentLocation returns LatLng on successful location fetch',
      () async {
        when(
          () => mockGeolocatorPlatform.isLocationServiceEnabled(),
        ).thenAnswer((_) async => true);
        when(
          () => mockGeolocatorPlatform.checkPermission(),
        ).thenAnswer((_) async => LocationPermission.whileInUse);
        when(() => mockGeolocatorPlatform.getCurrentPosition()).thenAnswer(
          (_) async => Position(
            latitude: 37.7749,
            longitude: -122.4194,
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 0,
            altitudeAccuracy: 0,
            headingAccuracy: 0,
          ),
        );

        final result = await geoLocatorRepository.getCurrentLocation();
        expect(result, isA<LatLng>());
        expect(result?.latitude, 37.7749);
        expect(result?.longitude, -122.4194);
      },
    );

    test(
      'getCurrentLocation throws LocationFetchFailedException on position fetch error',
      () async {
        when(
          () => mockGeolocatorPlatform.isLocationServiceEnabled(),
        ).thenAnswer((_) async => true);
        when(
          () => mockGeolocatorPlatform.checkPermission(),
        ).thenAnswer((_) async => LocationPermission.whileInUse);
        when(
          () => mockGeolocatorPlatform.getCurrentPosition(),
        ).thenThrow(Exception('Test error'));

        expect(
          () => geoLocatorRepository.getCurrentLocation(),
          throwsA(isA<LocationFetchFailedException>()),
        );
      },
    );

    test(
      'getCurrentLocation requests permission if initially denied and then succeeds',
      () async {
        when(
          () => mockGeolocatorPlatform.isLocationServiceEnabled(),
        ).thenAnswer((_) async => true);
        when(
          () => mockGeolocatorPlatform.checkPermission(),
        ).thenAnswer((_) async => LocationPermission.denied);
        when(
          () => mockGeolocatorPlatform.requestPermission(),
        ).thenAnswer((_) async => LocationPermission.whileInUse);
        when(() => mockGeolocatorPlatform.getCurrentPosition()).thenAnswer(
          (_) async => Position(
            latitude: 1.0,
            longitude: 2.0,
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 0,
            altitudeAccuracy: 0,
            headingAccuracy: 0,
          ),
        );

        final result = await geoLocatorRepository.getCurrentLocation();
        expect(result, isA<LatLng>());
        expect(result?.latitude, 1.0);
        expect(result?.longitude, 2.0);
        verify(() => mockGeolocatorPlatform.requestPermission()).called(1);
      },
    );
  });
}
