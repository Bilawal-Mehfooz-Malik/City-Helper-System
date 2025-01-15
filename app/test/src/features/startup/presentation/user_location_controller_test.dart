import 'package:app/src/features/startup/data/user_location_repository.dart';
import 'package:app/src/features/startup/domain/user_location.dart';
import 'package:app/src/features/startup/presentation/location_controller.dart';
import 'package:app/src/features/startup/presentation/user_location_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late ProviderContainer container;
  late MockUserLocationRepository userLocationRepository;

  ProviderContainer makeProviderContainer(
    MockUserLocationRepository userLocationRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        userLocationRepositoryProvider
            .overrideWithValue(userLocationRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUp(() {
    userLocationRepository = MockUserLocationRepository();
    container = makeProviderContainer(userLocationRepository);
  });

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<void>());
  });

  group('createUser', () {
    test('initial state is null', () {
      final controller = container.read(userLocationControllerProvider);
      expect(controller, const AsyncData<void>(null));
    });

    test(
        'locationController returns nullValue that throws LocationUnavailableException',
        () async {
      // setup
      final listener = Listener<AsyncValue<void>>();

      final controller =
          container.read(userLocationControllerProvider.notifier);
      container.listen(
        userLocationControllerProvider,
        listener.call,
        fireImmediately: true,
      );

      // run
      await controller.createUser();

      // verify
      // verifyInOrder([
      //   () => listener(null, const AsyncData<void>(null)),
      //   () => listener(
      //         const AsyncData<void>(null),
      //         any(that: isA<AsyncLoading<void>>()),
      //       ),
      //   () => listener(
      //         any(that: isA<AsyncLoading<void>>()),
      //         any(that: isA<AsyncError<LocationUnavailableException>>()),
      //       ),
      // ]);
    });

    test('createUser saves User Location Successfully', () async {
      // setup
      final listener = Listener<AsyncValue<void>>();
      const testLocation = UserLocation(latitude: 1, longitude: 1);
      final controller =
          container.read(userLocationControllerProvider.notifier);
      container
          .read(locationControllerProvider.notifier)
          .getLocationFromMap(testLocation);

      container.listen(
        userLocationControllerProvider,
        listener.call,
        fireImmediately: true,
      );

      // run
      await controller.createUser();

      // verify
    });
  });
}
