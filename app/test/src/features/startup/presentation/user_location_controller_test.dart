import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/features/startup/domain/location_exceptions.dart';
import 'package:app/src/features/startup/presentation/location_controller.dart';
import 'package:app/src/features/startup/presentation/user_location_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late ProviderContainer container;
  late MockUserLocationRepository userLocationRepository;
  late MockGeoLocatorRepository geoLocatorRepository;

  ProviderContainer makeProviderContainer(
    MockUserLocationRepository userLocationRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        userLocationRepositoryProvider
            .overrideWithValue(userLocationRepository),
        geoLocatorRepositoryProvider.overrideWithValue(geoLocatorRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUp(() {
    userLocationRepository = MockUserLocationRepository();
    geoLocatorRepository = MockGeoLocatorRepository();
    container = makeProviderContainer(userLocationRepository);
  });

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<void>());
    registerFallbackValue(const GeoLocation(latitude: 0, longitude: 0));
  });

  group('createUser', () {
    test('initial state is null', () {
      final controller = container.read(userLocationControllerProvider);
      expect(controller, const AsyncData<void>(null));
    });

    test(
        'locationController returns nullValue that throws LocationUnavailableException',
        () async {
      // Setup
      final listener = Listener<AsyncValue<void>>();
      final controller =
          container.read(userLocationControllerProvider.notifier);

      container.listen(
        userLocationControllerProvider,
        listener.call,
        fireImmediately: true,
      );

      // Run
      await controller.createUser();

      // Verify
      verifyInOrder([
        () => listener(null, const AsyncData<void>(null)),
        () => listener(
              const AsyncData<void>(null),
              any(that: isA<AsyncLoading<void>>()),
            ),
        () => listener(
              any(that: isA<AsyncLoading<void>>()),
              any(
                that: isA<AsyncError<void>>().having(
                  (e) => e.error,
                  'error',
                  isA<LocationUnavailableException>(),
                ),
              ),
            ),
      ]);
    });

    test('createUser saves User Location Successfully', () async {
      // Setup
      final listener = Listener<AsyncValue<void>>();
      final testLocation = GeoLocation(latitude: 1, longitude: 1);

      // Stub the repository so that setUserLocation returns a Future<void>
      when(() => userLocationRepository.setUserLocation(any()))
          .thenAnswer((_) async {});

      when(geoLocatorRepository.getCurrentLocation)
          .thenAnswer((_) async => testLocation);

      // Initializing locationController with [testLocation]
      await container
          .read(locationControllerProvider.notifier)
          .getCurrentLocation();

      final controller =
          container.read(userLocationControllerProvider.notifier);

      container.listen(
        userLocationControllerProvider,
        listener.call,
        fireImmediately: true,
      );

      // Run
      await controller.createUser();

      // Verify state transitions
      verifyInOrder([
        () => listener(null, const AsyncData<void>(null)),
        () => listener(
              const AsyncData<void>(null),
              any(that: isA<AsyncLoading<void>>()),
            ),
        () => listener(
              any(that: isA<AsyncLoading<void>>()),
              const AsyncData<void>(null),
            ),
      ]);
    });
  });
}
