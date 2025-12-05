// import 'package:app/src/features/pick_location/data/real/user_location_repository.dart';
// import 'package:app/src/features/startup/domain/location_exceptions.dart';
// import 'package:app/src/features/startup/presentation/controllers/local_user_location_saver.dart';
// import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../../../mocks.dart';

// void main() {
//   // Register fallback value for LatLng before any tests run
//   setUpAll(() {
//     registerFallbackValue(FakeLatLng());
//   });

//   group('LocalUserLocationSaver', () {
//     late MockUserLocationRepository mockUserLocationRepository;
//     late ProviderContainer container;

//     setUp(() {
//       mockUserLocationRepository = MockUserLocationRepository();
//       container = ProviderContainer(
//         overrides: [
//           userLocationRepositoryProvider.overrideWithValue(
//             mockUserLocationRepository,
//           ),
//         ],
//       );
//     });

//     tearDown(() {
//       container.dispose();
//     });

//     group('createUser', () {
//       test(
//         'updates state to AsyncData on success and calls setUserLocation',
//         () async {
//           const testLatLng = LatLng(1.0, 2.0);
//           // Mock the userLocationControllerProvider to return a specific AsyncValue
//           container.read(userLocationControllerProvider.notifier).state =
//               AsyncData(testLatLng);
//           when(
//             () => mockUserLocationRepository.setUserLocation(testLatLng),
//           ).thenAnswer((_) async => Future.value());

//           final controller = container.read(
//             localUserLocationSaverProvider.notifier,
//           );

//           await controller.createUser();

//           expect(container.read(localUserLocationSaverProvider).hasValue, true);
//           verify(
//             () => mockUserLocationRepository.setUserLocation(testLatLng),
//           ).called(1);
//         },
//       );

//       test(
//         'updates state to AsyncError on LocationUnavailableException when userLocation is null',
//         () async {
//           // Mock the userLocationControllerProvider to return a null value
//           container.read(userLocationControllerProvider.notifier).state =
//               const AsyncData(null);

//           final controller = container.read(
//             localUserLocationSaverProvider.notifier,
//           );

//           await controller.createUser();

//           expect(container.read(localUserLocationSaverProvider).hasError, true);
//           expect(
//             container.read(localUserLocationSaverProvider).error,
//             isA<LocationUnavailableException>(),
//           );
//           verifyNever(() => mockUserLocationRepository.setUserLocation(any()));
//         },
//       );

//       test(
//         'updates state to AsyncError when setUserLocation throws an error',
//         () async {
//           const testLatLng = LatLng(1.0, 2.0);
//           // Mock the userLocationControllerProvider to return a specific AsyncValue
//           container.read(userLocationControllerProvider.notifier).state =
//               AsyncData(testLatLng);
//           when(
//             () => mockUserLocationRepository.setUserLocation(testLatLng),
//           ).thenAnswer(
//             (_) => Future.error(Exception('Failed to save location')),
//           );

//           final controller = container.read(
//             localUserLocationSaverProvider.notifier,
//           );

//           await controller.createUser();

//           expect(container.read(localUserLocationSaverProvider).hasError, true);
//           expect(
//             container.read(localUserLocationSaverProvider).error,
//             isA<Exception>(),
//           );
//           verify(
//             () => mockUserLocationRepository.setUserLocation(testLatLng),
//           ).called(1);
//         },
//       );
//     });
//   });
// }
