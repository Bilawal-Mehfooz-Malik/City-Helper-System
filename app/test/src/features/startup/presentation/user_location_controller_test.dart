// import 'package:app/src/features/startup/data/user_location_repository.dart';
// import 'package:app/src/features/startup/domain/location_exceptions.dart';
// import 'package:app/src/features/startup/domain/user_location.dart';
// import 'package:app/src/features/startup/presentation/location_controller.dart';
// import 'package:app/src/features/startup/presentation/user_location_controller.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../../mocks.dart';

// void main() {
//   late ProviderContainer container;
//   late MockGeoLocatorRepository geoLocatorRepository;
//   late MockUserLocationRepository userLocationRepository;

//   ProviderContainer makeProviderContainer(
//     MockUserLocationRepository userLocationRepository,
//   ) {
//     final container = ProviderContainer(
//       overrides: [
//         userLocationRepositoryProvider
//             .overrideWithValue(userLocationRepository),
//       ],
//     );
//     addTearDown(container.dispose);
//     return container;
//   }

//   setUp(() {
//     userLocationRepository = MockUserLocationRepository();
//     container = makeProviderContainer(userLocationRepository);
//   });

//   group('createUser', () {
//     test('initial state is null', () {
//       final controller = container.read(userLocationControllerProvider);
//       expect(controller, const AsyncData<void>(null));
//     });

//     test(
//         'locationController returns nullValue that throws LocationUnavailableException',
//         () async {
//       // setup
//       final listener = Listener<AsyncValue<void>>();
//       when(() => container.read(locationControllerProvider))
//           .thenReturn(const AsyncData<UserLocation?>(null));

//       final controller =
//           container.read(userLocationControllerProvider.notifier);
//       container.listen(
//         userLocationControllerProvider,
//         listener.call,
//         fireImmediately: true,
//       );

//       // run
//       await controller.createUser();

//       // verify
//       verifyInOrder([
//         // Initial state should be AsyncData with null
//         () => listener(null, const AsyncData<void>(null)),
//         // Loading state
//         () => listener(
//               const AsyncData<void>(null),
//               any(that: isA<AsyncLoading<void>>()),
//             ),
//         // Error state when location is unavailable
//         () => listener(
//               any(that: isA<AsyncLoading<void>>()),
//               any(that: isA<AsyncError<LocationUnavailableException>>()),
//             ),
//       ]);
//     });
//   });
// }
