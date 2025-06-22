import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/startup/domain/location_exceptions.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:app/src/features/startup/presentation/controllers/local_user_location_saver.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late ProviderContainer container;
  late MockUserLocationRepository userLocationRepository;
  late MockGeoLocatorRepository geoLocatorRepository;

  ProviderContainer makeProviderContainer(
    MockUserLocationRepository userLocationRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        userLocationRepositoryProvider.overrideWithValue(
          userLocationRepository,
        ),
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
    registerFallbackValue(LatLng(0, 0));
  });

  group('createUser', () {
    test('initial state is null', () {
      final controller = container.read(localUserLocationSaverProvider);
      expect(controller, const AsyncData<void>(null));
    });

    test(
      'locationController returns nullValue that throws LocationUnavailableException',
      () async {
        // Setup
        final listener = Listener<AsyncValue<void>>();
        final controller = container.read(
          localUserLocationSaverProvider.notifier,
        );

        container.listen(
          localUserLocationSaverProvider,
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
      },
    );

    test('createUser saves User Location Successfully', () async {
      // Setup
      final listener = Listener<AsyncValue<void>>();
      final testLocation = LatLng(1, 1);

      // Stub the repository so that setUserLocation returns a Future<void>
      when(
        () => userLocationRepository.setUserLocation(any()),
      ).thenAnswer((_) async {});

      when(
        geoLocatorRepository.getCurrentLocation,
      ).thenAnswer((_) async => testLocation);

      // Initializing locationController with [testLocation]
      await container
          .read(userLocationControllerProvider.notifier)
          .getCurrentLocation();

      final controller = container.read(
        localUserLocationSaverProvider.notifier,
      );

      container.listen(
        localUserLocationSaverProvider,
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
