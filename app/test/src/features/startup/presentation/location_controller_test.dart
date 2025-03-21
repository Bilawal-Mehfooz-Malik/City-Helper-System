import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
import 'package:app/src/features/startup/data/real/location_search_repository.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';
import 'package:app/src/features/startup/presentation/location_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks.dart';

void main() {
  late ProviderContainer container;
  late MockGeoLocatorRepository geoLocatorRepository;
  late MockLocationSearchRepository locationSearchRepository;

  const nullData = AsyncData<GeoLocation?>(null);
  const testLocation = GeoLocation(latitude: 123, longitude: 123);
  const data = AsyncData<GeoLocation?>(testLocation);

  ProviderContainer makeProviderContainer(
    MockGeoLocatorRepository geoLocatorRepository,
    MockLocationSearchRepository locationSearchRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        geoLocatorRepositoryProvider.overrideWithValue(geoLocatorRepository),
        locationSearchRepositoryProvider
            .overrideWithValue(locationSearchRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  // Set up the mocks and container before each test
  setUp(() {
    geoLocatorRepository = MockGeoLocatorRepository();
    locationSearchRepository = MockLocationSearchRepository();
    container =
        makeProviderContainer(geoLocatorRepository, locationSearchRepository);
  });
  // Register fallback values for mocking AsyncValues
  setUpAll(() {
    registerFallbackValue(const AsyncLoading<GeoLocation?>());
  });

  group('getCurrentLocation', () {
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
  });

  group('getLocationFromMap', () {
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

    group('fetchPlaceDetails', () {
      // [DummyData]
      final dummySuggestion = PlaceSuggestion(id: 'dummy', name: 'dummy');
      final testGeoLocation = GeoLocation(latitude: 42, longitude: 24);
      final testPlace =
          Place(geoLocation: testGeoLocation, id: 'dummy', name: 'dummy');

      test(
          'returns valid Place and updates state when place has a valid geoLocation',
          () async {
        // setup
        when(() => locationSearchRepository.fetchPlaceDetails(dummySuggestion))
            .thenAnswer((_) async => testPlace);

        final listener = Listener<AsyncValue<GeoLocation?>>();
        final controller = container.read(locationControllerProvider.notifier);
        container.listen(
          locationControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        // Fetch place details
        final result = await controller.fetchPlaceDetails(dummySuggestion);

        // Verify the result and state
        expect(result, equals(testPlace));
        expect(
          container.read(locationControllerProvider),
          equals(AsyncData<GeoLocation?>(testGeoLocation)),
        );

        // Verify that a listener was called at least once.
        verify(() => listener(any(), any())).called(greaterThanOrEqualTo(1));
      });

      test(
          'returns null and updates state to AsyncData(null) when place.geoLocation is null',
          () async {
        final place = Place(geoLocation: null, id: 'dummy', name: 'dummy');
        when(() => locationSearchRepository.fetchPlaceDetails(dummySuggestion))
            .thenAnswer((_) async => place);

        final listener = Listener<AsyncValue<GeoLocation?>>();
        final controller = container.read(locationControllerProvider.notifier);
        container.listen(
          locationControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        // Fetch place details
        final result = await controller.fetchPlaceDetails(dummySuggestion);

        // Verify the result and state
        expect(result, isNull);
        expect(container.read(locationControllerProvider),
            const AsyncData<GeoLocation?>(null));
      });

      test('sets state to AsyncError when repository throws an exception',
          () async {
        final exception = Exception('Failed to fetch place details');

        when(() => locationSearchRepository.fetchPlaceDetails(dummySuggestion))
            .thenThrow(exception);

        final listener = Listener<AsyncValue<GeoLocation?>>();
        final controller = container.read(locationControllerProvider.notifier);
        container.listen(
          locationControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        // Fetch place details
        final result = await controller.fetchPlaceDetails(dummySuggestion);

        // Verify the result and state
        expect(result, isNull);
        final state = container.read(locationControllerProvider);
        expect(state, isA<AsyncError<GeoLocation?>>());
      });
    });
  });
}
