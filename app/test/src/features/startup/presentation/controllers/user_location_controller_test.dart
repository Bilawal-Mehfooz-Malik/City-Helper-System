// import 'package:app/src/features/pick_location/data/geolocator_repository.dart';
// import 'package:app/src/features/startup/domain/location_exceptions.dart';
// import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../../../mocks.dart';

// void main() {
//   group('UserLocationController', () {
//     late MockGeoLocatorRepository mockGeoLocatorRepository;
//     late ProviderContainer container;

//     setUp(() {
//       mockGeoLocatorRepository = MockGeoLocatorRepository();
//       container = ProviderContainer(
//         overrides: [
//           geoLocatorRepositoryProvider.overrideWithValue(
//             mockGeoLocatorRepository,
//           ),
//         ],
//       );
//     });

//     tearDown(() {
//       container.dispose();
//     });

//     test('build returns null initially', () {
//       expect(container.read(userLocationControllerProvider).value, null);
//     });

//     group('getCurrentLocation', () {
//       test('updates state to AsyncData with location on success', () async {
//         const testLatLng = LatLng(1.0, 2.0);
//         when(
//           () => mockGeoLocatorRepository.getCurrentLocation(),
//         ).thenAnswer((_) async => testLatLng);

//         final controller = container.read(
//           userLocationControllerProvider.notifier,
//         );

//         await controller.getCurrentLocation();

//         expect(
//           container.read(userLocationControllerProvider).value,
//           testLatLng,
//         );
//         verify(() => mockGeoLocatorRepository.getCurrentLocation()).called(1);
//       });

//       test(
//         'updates state to AsyncError on LocationServicesDisabledException',
//         () async {
//           when(
//             () => mockGeoLocatorRepository.getCurrentLocation(),
//           ).thenThrow(LocationServicesDisabledException());

//           final controller = container.read(
//             userLocationControllerProvider.notifier,
//           );

//           await controller.getCurrentLocation();

//           expect(container.read(userLocationControllerProvider).hasError, true);
//           expect(
//             container.read(userLocationControllerProvider).error,
//             isA<LocationServicesDisabledException>(),
//           );
//           verify(() => mockGeoLocatorRepository.getCurrentLocation()).called(1);
//         },
//       );

//       test(
//         'updates state to AsyncError on LocationPermissionDeniedException',
//         () async {
//           when(
//             () => mockGeoLocatorRepository.getCurrentLocation(),
//           ).thenThrow(LocationPermissionDeniedException());

//           final controller = container.read(
//             userLocationControllerProvider.notifier,
//           );

//           await controller.getCurrentLocation();

//           expect(container.read(userLocationControllerProvider).hasError, true);
//           expect(
//             container.read(userLocationControllerProvider).error,
//             isA<LocationPermissionDeniedException>(),
//           );
//           verify(() => mockGeoLocatorRepository.getCurrentLocation()).called(1);
//         },
//       );

//       test(
//         'updates state to AsyncError on LocationPermissionDeniedForeverException',
//         () async {
//           when(
//             () => mockGeoLocatorRepository.getCurrentLocation(),
//           ).thenThrow(LocationPermissionDeniedForeverException());

//           final controller = container.read(
//             userLocationControllerProvider.notifier,
//           );

//           await controller.getCurrentLocation();

//           expect(container.read(userLocationControllerProvider).hasError, true);
//           expect(
//             container.read(userLocationControllerProvider).error,
//             isA<LocationPermissionDeniedForeverException>(),
//           );
//           verify(() => mockGeoLocatorRepository.getCurrentLocation()).called(1);
//         },
//       );

//       test(
//         'updates state to AsyncError on LocationFetchFailedException',
//         () async {
//           when(
//             () => mockGeoLocatorRepository.getCurrentLocation(),
//           ).thenThrow(LocationFetchFailedException());

//           final controller = container.read(
//             userLocationControllerProvider.notifier,
//           );

//           await controller.getCurrentLocation();

//           expect(container.read(userLocationControllerProvider).hasError, true);
//           expect(
//             container.read(userLocationControllerProvider).error,
//             isA<LocationFetchFailedException>(),
//           );
//           verify(() => mockGeoLocatorRepository.getCurrentLocation()).called(1);
//         },
//       );
//     });

//     group('getLocationFromMap', () {
//       test('updates state to AsyncData with provided location', () async {
//         const testLatLng = LatLng(3.0, 4.0);

//         final controller = container.read(
//           userLocationControllerProvider.notifier,
//         );

//         controller.getLocationFromMap(testLatLng);

//         expect(
//           container.read(userLocationControllerProvider).value,
//           testLatLng,
//         );
//       });
//     });
//   });
// }
