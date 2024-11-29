import 'package:app/src/features/startup/domain/geo_location.dart';
import 'package:app/src/features/startup/domain/user_location_repository.dart';
import 'package:app/src/features/startup/presentation/user_location_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late ProviderContainer container;
  const data = AsyncData<GeoLocation?>(null);
  late MockUserLocationRepository userLocationRepository;
  final testLocation = GeoLocation(latitude: 123, longitude: 123);

  // Creates the ProviderContainer with overridden dependencies
  ProviderContainer makeProviderContainer(
      MockUserLocationRepository userLocationRepository) {
    final container = ProviderContainer(
      overrides: [
        userLocationRepositoryProvider.overrideWithValue(userLocationRepository)
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  // Set up the mocks and container before each test
  setUp(() {
    userLocationRepository = MockUserLocationRepository();
    container = makeProviderContainer(userLocationRepository);
  });

  // Register fallback values for mocking AsyncValues
  setUpAll(() {
    registerFallbackValue(const AsyncLoading<GeoLocation?>());
  });

  group('LocationController', () {
    test('initial state is null', () {
      final locationController = container.read(userLocationControllerProvider);
      expect(locationController, const AsyncData<GeoLocation?>(null));
    });

    test('getCurrentLocation sets state to loading and then to success',
        () async {
      // Mocking the repository to return a test location
      when(() => userLocationRepository.getCurrentLocation())
          .thenAnswer((_) async => testLocation);

      final listener = Listener<
          AsyncValue<GeoLocation?>>(); // Listener to capture state changes
      final controller =
          container.read(userLocationControllerProvider.notifier);

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
        () => listener(null, data),
        // Loading state
        () => listener(data, any(that: isA<AsyncLoading<GeoLocation?>>())),
        // Success state with testLocation
        () => listener(any(that: isA<AsyncLoading<GeoLocation?>>()),
            AsyncData<GeoLocation?>(testLocation)),
      ]);
    });

    test('getCurrentLocation sets state to loading and then to error',
        () async {
      // Mocking the repository to throw an exception
      when(() => userLocationRepository.getCurrentLocation())
          .thenThrow(Exception('Failed to get location'));

      final listener = Listener<
          AsyncValue<GeoLocation?>>(); // Listener to capture state changes
      final locationControllerNotifier =
          container.read(userLocationControllerProvider.notifier);

      // Listening to changes in the state
      container.listen(
        userLocationControllerProvider,
        listener.call,
        fireImmediately: true,
      );

      // Run the action
      await locationControllerNotifier.getCurrentLocation();

      // Verify the state changes
      verifyInOrder([
        // Initial state should be AsyncData with null
        () => listener(null, data),
        // Loading state
        () => listener(data, any(that: isA<AsyncLoading<GeoLocation?>>())),
        // Error state with exception
        () => listener(any(that: isA<AsyncLoading<GeoLocation?>>()),
            any(that: isA<AsyncError<GeoLocation?>>())),
      ]);
    });

    test('getLocationFromMap sets state to loading and then to success',
        () async {
      // Mocking the repository to return a test location
      when(() => userLocationRepository.getLocationFromMap())
          .thenAnswer((_) async => testLocation);

      final listener = Listener<
          AsyncValue<GeoLocation?>>(); // Listener to capture state changes
      final locationControllerNotifier =
          container.read(userLocationControllerProvider.notifier);

      // Listening to changes in the state
      container.listen(
        userLocationControllerProvider,
        listener.call,
        fireImmediately: true,
      );

      // Run the action
      await locationControllerNotifier.getLocationFromMap();

      // Verify the state changes
      verifyInOrder([
        // Initial state should be AsyncData with null
        () => listener(null, data),
        // Loading state
        () => listener(data, any(that: isA<AsyncLoading<GeoLocation?>>())),
        // Success state with testLocation
        () => listener(any(that: isA<AsyncLoading<GeoLocation?>>()),
            AsyncData<GeoLocation?>(testLocation)),
      ]);
    });

    test('getLocationFromMap sets state to loading and then to error',
        () async {
      // Mocking the repository to throw an exception
      when(() => userLocationRepository.getLocationFromMap())
          .thenThrow(Exception('Failed to get location'));

      final listener = Listener<
          AsyncValue<GeoLocation?>>(); // Listener to capture state changes
      final locationControllerNotifier =
          container.read(userLocationControllerProvider.notifier);

      // Listening to changes in the state
      container.listen(
        userLocationControllerProvider,
        listener.call,
        fireImmediately: true,
      );

      // Run the action
      await locationControllerNotifier.getLocationFromMap();

      // Verify the state changes
      verifyInOrder([
        // Initial state should be AsyncData with null
        () => listener(null, data),
        // Loading state
        () => listener(data, any(that: isA<AsyncLoading<GeoLocation?>>())),
        // Error state with exception
        () => listener(any(that: isA<AsyncLoading<GeoLocation?>>()),
            any(that: isA<AsyncError<GeoLocation?>>())),
      ]);
    });
  });
}
