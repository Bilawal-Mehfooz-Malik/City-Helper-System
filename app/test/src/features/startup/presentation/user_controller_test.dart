// import 'package:app/src/features/startup/domain/app_user.dart';
// import 'package:app/src/features/startup/domain/geo_location.dart';
// import 'package:app/src/features/startup/domain/user_location_repository.dart';
// import 'package:app/src/features/startup/domain/user_repository.dart';
// import 'package:app/src/features/startup/presentation/user_controller.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../../mocks.dart';

// void main() {
//   late ProviderContainer container;
//   late MockUserRepository userRepository;
//   late MockUserLocationRepository userLocationRepository;
//   final testLocation = GeoLocation(latitude: 123, longitude: 123);
//   final testUser =
//       AppUser(userLocation: testLocation, lastUpdated: DateTime.now());

//   // Creates the ProviderContainer with overridden dependencies
//   ProviderContainer makeProviderContainer(
//     MockUserRepository userRepository,
//     MockUserLocationRepository userLocationRepository,
//   ) {
//     container = ProviderContainer(
//       overrides: [
//         userRepositoryProvider.overrideWithValue(userRepository),
//         userLocationRepositoryProvider
//             .overrideWithValue(userLocationRepository),
//       ],
//     );
//     addTearDown(container.dispose);
//     return container;
//   }

//   setUp(() {
//     userRepository = MockUserRepository();
//     userLocationRepository = MockUserLocationRepository();
//     container = makeProviderContainer(userRepository, userLocationRepository);
//   });

//   setUpAll(() {
//     registerFallbackValue(const AsyncLoading<AppUser?>());
//     registerFallbackValue(const AsyncLoading<GeoLocation?>());
//   });

//   group('UserController - GetCurrentLocation', () {
//     test('createUser creates user and navigate when location is available',
//         () async {
//       when(() => userLocationRepository.getCurrentLocation())
//           .thenAnswer((_) => Future.value(testLocation));
//       when(() => userRepository.setUser(testUser))
//           .thenAnswer((_) => Future.value());

//       final userController = container.read(userControllerProvider.notifier);

//       // run
//       await userController.createUser();

//       verifyInOrder[
//         ()=>(userController)
//       ];

//       // Assert
//       verify(() => userLocationRepository.getCurrentLocation()).called(1);
//       verify(() => userRepository.setUser(testUser)).called(1);
//       expect(userController.state, isA<AsyncData<AppUser>>());
//       // You can add more assertions depending on what happens after navigating
//     });
//   });
// }
