import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late ProviderContainer container;
  late MockGeoLocatorRepository geoLocatorRepository;

  const nullData = AsyncData<LatLng?>(null);
  final testLocation = LatLng(123, 123);
  final data = AsyncData<LatLng?>(testLocation);

  ProviderContainer makeProviderContainer(
    MockGeoLocatorRepository geoLocatorRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        geoLocatorRepositoryProvider.overrideWithValue(geoLocatorRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  // Set up the mocks and container before each test
  setUp(() {
    geoLocatorRepository = MockGeoLocatorRepository();
    container = makeProviderContainer(geoLocatorRepository);
  });
  // Register fallback values for mocking AsyncValues
  setUpAll(() {
    registerFallbackValue(const AsyncLoading<LatLng?>());
  });

  group('getCurrentLocation', () {
    test('initial state is null', () {
      final controller = container.read(userLocationControllerProvider);
      expect(controller, const AsyncData<LatLng?>(null));
    });

    test(
      'getCurrentLocation sets state to loading and then to success',
      () async {
        // Mocking the repository to return a test location
        when(
          () => geoLocatorRepository.getCurrentLocation(),
        ).thenAnswer((_) async => testLocation);
        final listener = Listener<AsyncValue<LatLng?>>();
        final controller = container.read(
          userLocationControllerProvider.notifier,
        );

        // Listening to changes in the state
        container.listen(
          userLocationControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        // Run the action
        await controller.getCurrentLocation();

        // Verify the state changes
        verifyInOrder([
          // Initial state should be AsyncData with null
          () => listener(null, nullData),
          // Loading state
          () => listener(nullData, any(that: isA<AsyncLoading<LatLng?>>())),
          // Success state with testLocation
          () => listener(any(that: isA<AsyncLoading<LatLng?>>()), data),
        ]);
      },
    );

    test(
      'getCurrentLocation sets state to loading and then to error',
      () async {
        // Mocking the repository to throw an exception
        when(
          () => geoLocatorRepository.getCurrentLocation(),
        ).thenThrow(Exception('Failed to get location'));
        final listener = Listener<AsyncValue<LatLng?>>();
        final controller = container.read(
          userLocationControllerProvider.notifier,
        );

        // Listening to changes in the state
        container.listen(
          userLocationControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        // Run the action
        await controller.getCurrentLocation();
        // Verify the state changes
        verifyInOrder([
          // Initial state should be AsyncData with null
          () => listener(null, nullData),
          // Loading state
          () => listener(nullData, any(that: isA<AsyncLoading<LatLng?>>())),
          // Error state with exception
          () => listener(
            any(that: isA<AsyncLoading<LatLng?>>()),
            any(that: isA<AsyncError<LatLng?>>()),
          ),
        ]);
      },
    );
  });

  group('getLocationFromMap', () {
    test(
      'getLocationFromMap sets state to loading and then to success',
      () async {
        final listener = Listener<AsyncValue<LatLng?>>();
        final controller = container.read(
          userLocationControllerProvider.notifier,
        );

        // Listening to changes in the state
        container.listen(
          userLocationControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        // Run
        controller.getLocationFromMap(testLocation);

        // Verify the state changes
        verifyInOrder([
          // Initial state should be AsyncData with null
          () => listener(null, nullData),
          // Loading state
          () => listener(nullData, any(that: isA<AsyncLoading<LatLng?>>())),
          // Success state with testLocation
          () => listener(any(that: isA<AsyncLoading<LatLng?>>()), data),
        ]);
      },
    );
  });
}
