// import 'package:app/src/features/startup/data/fake_user_repository.dart';
// import 'package:app/src/features/startup/domain/geo_location.dart';
// import 'package:app/src/features/startup/presentation/user_location_controller.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../../mocks.dart';

// void main() {
//   late ProviderContainer container;
//   const data = AsyncData<void>(null);
//   late MockUserLocationRepository userLocationRepository;
//   final testLocation = GeoLocation(latitude: 123, longitude: 123);

//   ProviderContainer makeProviderContainer(
//       MockUserLocationRepository userLocationRepository) {
//     final container = ProviderContainer(
//       overrides: [
//         fakeLocationRepositoryProvider.overrideWithValue(userLocationRepository)
//       ],
//     );
//     addTearDown(container.dispose);
//     return container;
//   }

//   setUp(() {
//     userLocationRepository = MockUserLocationRepository();
//     container = makeProviderContainer(userLocationRepository);
//   });

//   setUpAll(() {
//     registerFallbackValue(const AsyncLoading<int>());
//   });

//   group('LocationController', () {
//     test('initial state is AsyncData<void>', () {
//       final locationController = container.read(userLocationControllerProvider);
//       expect(locationController, const AsyncData<void>(null));
//     });

//     test('getCurrentLocation sets state to loading and then to success',
//         () async {
//       // Mocking the repository to return a test location
//       when(() => userLocationRepository.getCurrentLocation())
//           .thenAnswer((_) async => testLocation);

//       // Create a listener for changes in the state
//       final listener = Listener<AsyncValue<void>>();
//       final locationControllerNotifier =
//           container.read(userLocationControllerProvider.notifier);

//       // Listen to the changes in the provider state
//       container.listen(
//         userLocationControllerProvider,
//         listener.call,
//         fireImmediately: true,
//       );

//       // Run the action
//       await locationControllerNotifier.getCurrentLocation();

//       // Verify the state changes
//       verifyInOrder([
//         // Initial state should be AsyncData with null
//         () => listener(null, data),
//         // Loading state
//         () => listener(data, any(that: isA<AsyncLoading>())),
//         // Success state with testLocation
//         () => listener(
//             any(that: isA<AsyncLoading>()), AsyncData<void>(testLocation)),
//       ]);
//     });

//     test('getCurrentLocation sets state to loading and then to error',
//         () async {
//       // Mocking the repository to throw an exception
//       when(() => userLocationRepository.getCurrentLocation())
//           .thenThrow(Exception('Failed to get location'));

//       // Create a listener for changes in the state
//       final listener = Listener<AsyncValue<void>>();
//       final locationControllerNotifier =
//           container.read(userLocationControllerProvider.notifier);

//       // Listen to the changes in the provider state
//       container.listen(
//         userLocationControllerProvider,
//         listener.call,
//         fireImmediately: true,
//       );

//       // Run the action
//       await locationControllerNotifier.getCurrentLocation();

//       // Verify the state changes
//       verifyInOrder([
//         // Initial state should be AsyncData with null
//         () => listener(null, data),
//         // Loading state
//         () => listener(data, any(that: isA<AsyncLoading>())),
//         // Error state with exception
//         () => listener(
//             any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
//       ]);
//     });

//     test('getLocationFromMap sets state to loading and then to success',
//         () async {
//       // Mocking the repository to return a test location
//       when(() => userLocationRepository.getLocationFromMap())
//           .thenAnswer((_) async => testLocation);

//       // Create a listener for changes in the state
//       final listener = Listener<AsyncValue<void>>();
//       final locationControllerNotifier =
//           container.read(userLocationControllerProvider.notifier);

//       // Listen to the changes in the provider state
//       container.listen(
//         userLocationControllerProvider,
//         listener.call,
//         fireImmediately: true,
//       );

//       // Run the action
//       await locationControllerNotifier.getLocationFromMap();

//       // Verify the state changes
//       verifyInOrder([
//         // Initial state should be AsyncData with null
//         () => listener(null, data),
//         // Loading state
//         () => listener(data, any(that: isA<AsyncLoading>())),
//         // Success state with testLocation
//         () => listener(
//             any(that: isA<AsyncLoading>()), AsyncData<void>(testLocation)),
//       ]);
//     });

//     test('getCurrentLocation sets state to loading and then to error',
//         () async {
//       // Mocking the repository to throw an exception
//       when(() => userLocationRepository.getLocationFromMap())
//           .thenThrow(Exception('Failed to get location'));

//       // Create a listener for changes in the state
//       final listener = Listener<AsyncValue<void>>();
//       final locationControllerNotifier =
//           container.read(userLocationControllerProvider.notifier);

//       // Listen to the changes in the provider state
//       container.listen(
//         userLocationControllerProvider,
//         listener.call,
//         fireImmediately: true,
//       );

//       // Run the action
//       await locationControllerNotifier.getLocationFromMap();

//       // Verify the state changes
//       verifyInOrder([
//         // Initial state should be AsyncData with null
//         () => listener(null, data),
//         // Loading state
//         () => listener(data, any(that: isA<AsyncLoading>())),
//         // Error state with exception
//         () => listener(
//             any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
//       ]);
//     });
//   });
// }
