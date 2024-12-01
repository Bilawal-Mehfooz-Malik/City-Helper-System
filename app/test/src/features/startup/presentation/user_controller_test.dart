import 'package:app/src/core/utils/current_date_provider.dart';
import 'package:app/src/features/startup/domain/app_user.dart';
import 'package:app/src/features/startup/domain/user_location_repository.dart';
import 'package:app/src/features/startup/domain/user_repository.dart';
import 'package:app/src/features/startup/presentation/user_controller.dart';
import 'package:app/src/features/startup/presentation/user_location_controller.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late MockAppRouter mockAppRouter;
  late ProviderContainer container;
  late MockUserRepository mockUserRepository;
  late MockUserLocationRepository mockUserLocationRepository;

  // Fixed date for testing
  final fixedDate = DateTime(2024, 1, 1);
  const testLocation = LatLng(123, 123);

  setUpAll(() {
    registerFallbackValue(FakeAppUser());
  });

  setUp(() {
    mockAppRouter = MockAppRouter();
    mockUserRepository = MockUserRepository();
    mockUserLocationRepository = MockUserLocationRepository();

    container = ProviderContainer(
      overrides: [
        userRepositoryProvider.overrideWithValue(mockUserRepository),
        userLocationRepositoryProvider
            .overrideWithValue(mockUserLocationRepository),
        appRouterProvider.overrideWithValue(mockAppRouter),
        currentDateProvider.overrideWithValue(fixedDate),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('UserControllerTests', () {
    test('createUser creates user and navigates when location is available',
        () async {
      when(mockUserLocationRepository.getCurrentLocation)
          .thenAnswer((_) => Future.value(testLocation));
      when(() => mockUserRepository.setUser(any()))
          .thenAnswer((_) => Future.value());
      when(() => mockAppRouter.goNamed(AppRoute.home.name)).thenReturn(null);

      final userLocationController =
          container.read(userLocationControllerProvider.notifier);
      await userLocationController.getCurrentLocation();

      final userController = container.read(userControllerProvider.notifier);

      // Act
      await userController.createUser();

      // Verify
      verify(
        () => mockUserRepository.setUser(
          any(
            that: isA<AppUser>()
                .having((u) => u.userLocation.latitude, 'latitude', 123)
                .having((u) => u.userLocation.longitude, 'longitude', 123)
                .having((u) => u.lastUpdated, 'lastUpdated', fixedDate),
          ),
        ),
      ).called(1);

      verify(() => mockAppRouter.goNamed(AppRoute.home.name)).called(1);

      final state = container.read(userControllerProvider);
      expect(state, isA<AsyncData<void>>());
    });

    test('createUser does not navigate if location is unavailable', () async {
      when(mockUserLocationRepository.getCurrentLocation)
          .thenAnswer((_) => Future.value(null));

      final userLocationController =
          container.read(userLocationControllerProvider.notifier);
      await userLocationController.getCurrentLocation();

      final userController = container.read(userControllerProvider.notifier);

      // Act
      await userController.createUser();

      // Assert
      verifyNever(() => mockAppRouter.goNamed(AppRoute.home.name));
      final state = container.read(userControllerProvider);
      expect(state, isA<AsyncError>());
      expect(
        (state as AsyncError).error,
        'User location not available'.hardcoded,
      );
    });

    // test('fetchUser retrieves user successfully', () async {
    //   final testUser =
    //       AppUser(userLocation: testLocation, lastUpdated: fixedDate);

    //   when(mockUserRepository.fetchUser)
    //       .thenAnswer((_) => Future.value(testUser));

    //   final userController = container.read(userControllerProvider.notifier);

    //   // Run
    //   await userController.fetchUser();

    //   // Verify
    //   final state = container.read(userControllerProvider);
    //   expect(state, isA<AsyncData<AppUser>>());
    //   expect((state as AsyncData<AppUser>).value, testUser);
    // });

    test('fetchUser handles error from repository', () async {
      when(() => mockUserRepository.fetchUser())
          .thenThrow(Exception('Failed to fetch user'));

      final userController = container.read(userControllerProvider.notifier);

      // Act
      await userController.fetchUser();

      // Assert
      final state = container.read(userControllerProvider);
      expect(state, isA<AsyncError>());
      expect((state as AsyncError).error, isException);
    });

    // test('AppRouter navigates to the correct route', () {
    //   final appRouter = container.read(appRouterProvider);
    //   appRouter.goNamed(AppRoute.permissionDenied.name);

    //   // Verify navigation
    //   verify(() => mockAppRouter.goNamed(AppRoute.permissionDenied.name))
    //       .called(1);
    // });
  });
}
