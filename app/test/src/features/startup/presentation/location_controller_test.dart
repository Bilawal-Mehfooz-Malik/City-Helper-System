import 'package:app/src/features/startup/data/geolocator_repository.dart';
import 'package:app/src/features/startup/domain/user_location.dart';
import 'package:app/src/features/startup/presentation/location_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks.dart';

void main() {
  late ProviderContainer container;
  late MockGeoLocatorRepository geoLocatorRepository;

  const nullData = AsyncData<GeoLocation?>(null);
  const testLocation = GeoLocation(latitude: 123, longitude: 123);
  const data = AsyncData<GeoLocation?>(testLocation);

  ProviderContainer makeProviderContainer(
    MockGeoLocatorRepository geoLocatorRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        geoLocatorRepositoryProvider.overrideWithValue(geoLocatorRepository)
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
    registerFallbackValue(const AsyncLoading<GeoLocation?>());
  });
  group('LocationController', () {
    test('initial state is null', () {
      final controller = container.read(locationControllerProvider);
      expect(controller, const AsyncData<GeoLocation?>(null));
    });

    test('getCurrentLocation sets state to loading and then to success',
        () async {
      // Mocking the repository to return a test location
      when(() => geoLocatorRepository.getCurrentLocation())
          .thenAnswer((_) async => testLocation);
      final listener = Listener<AsyncValue<GeoLocation?>>();
      final controller = container.read(locationControllerProvider.notifier);

      // Listening to changes in the state
      container.listen(
        locationControllerProvider,
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
        () => listener(nullData, any(that: isA<AsyncLoading<GeoLocation?>>())),
        // Success state with testLocation
        () => listener(any(that: isA<AsyncLoading<GeoLocation?>>()), data),
      ]);
    });

    test('getCurrentLocation sets state to loading and then to error',
        () async {
      // Mocking the repository to throw an exception
      when(() => geoLocatorRepository.getCurrentLocation())
          .thenThrow(Exception('Failed to get location'));
      final listener = Listener<AsyncValue<GeoLocation?>>();
      final controller = container.read(locationControllerProvider.notifier);

      // Listening to changes in the state
      container.listen(
        locationControllerProvider,
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
        () => listener(nullData, any(that: isA<AsyncLoading<GeoLocation?>>())),
        // Error state with exception
        () => listener(
              any(that: isA<AsyncLoading<GeoLocation?>>()),
              any(that: isA<AsyncError<GeoLocation?>>()),
            ),
      ]);
    });

    test('getLocationFromMap sets state to loading and then to success',
        () async {
      final listener = Listener<AsyncValue<GeoLocation?>>();
      final controller = container.read(locationControllerProvider.notifier);

      // Listening to changes in the state
      container.listen(
        locationControllerProvider,
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
        () => listener(nullData, any(that: isA<AsyncLoading<GeoLocation?>>())),
        // Success state with testLocation
        () => listener(any(that: isA<AsyncLoading<GeoLocation?>>()), data),
      ]);
    });
  });
}
