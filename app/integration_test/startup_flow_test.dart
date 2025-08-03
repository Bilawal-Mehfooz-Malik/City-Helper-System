import 'package:app/src/core/common_widgets/alert_dialogs.dart';
import 'package:app/src/features/startup/data/fake/fake_geolocator_repository.dart';
import 'package:app/src/features/startup/data/fake/fake_user_location_repository.dart';
import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';

import '../test/src/robot.dart';

void main() {
  setUpAll(() => WidgetController.hitTestWarningShouldBeFatal = true);

  group('Startup Feature Integration Tests', () {
    testWidgets('User sets current location (Desktop Flow)', (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        final fakeUserLocationRepository = FakeUserLocationRepository();
        final overrides = [
          userLocationRepositoryProvider.overrideWithValue(
            fakeUserLocationRepository,
          ),
        ];

        await r.pumpMyApp(overrides: overrides);
        await tester.pumpAndSettle();

        await r.startupRobot.tapGetCurrentButton();
        await tester.pumpAndSettle();

        await r.startupRobot.tapSaveButton();
        await tester.pumpAndSettle();

        r.categoriesRobot.expectCategoriesScreen();
      });
    });

    testWidgets(
      'Shows error when location services are disabled (Desktop Flow)',
      (tester) async {
        await tester.runAsync(() async {
          final r = Robot(tester);
          final fakeGeoLocatorRepository = FakeGeoLocatorRepository(
            locationServiceEnabled: false,
          );
          final overrides = [
            userLocationRepositoryProvider.overrideWithValue(
              FakeUserLocationRepository(),
            ),
            geoLocatorRepositoryProvider.overrideWithValue(
              fakeGeoLocatorRepository,
            ),
          ];

          final container = await r.pumpMyApp(overrides: overrides);
          await tester.pumpAndSettle();

          await r.startupRobot.tapGetCurrentButton();
          await tester.pumpAndSettle();

          await Future.doWhile(() async {
            await tester.pumpAndSettle();
            return !container.read(userLocationControllerProvider).hasError;
          }).timeout(
            const Duration(seconds: 5),
            onTimeout: () {
              fail(
                'UserLocationController did not enter error state within timeout.',
              );
            },
          );

          expect(find.byKey(kDialogDefaultKey), findsOneWidget);
          await tester.tap(find.text('cancel'));
          await tester.pumpAndSettle();
        });
      },
    );

    testWidgets('Shows error when location permission is denied (Desktop Flow)', (
      tester,
    ) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        final fakeGeoLocatorRepository = FakeGeoLocatorRepository(
          permission: LocationPermission.denied,
        );
        final overrides = [
          userLocationRepositoryProvider.overrideWithValue(
            FakeUserLocationRepository(),
          ),
          geoLocatorRepositoryProvider.overrideWithValue(
            fakeGeoLocatorRepository,
          ),
        ];

        final container = await r.pumpMyApp(overrides: overrides);
        await tester.pumpAndSettle();

        await r.startupRobot.tapGetCurrentButton();
        await tester.pumpAndSettle();

        await Future.doWhile(() async {
          await tester.pumpAndSettle();
          return !container.read(userLocationControllerProvider).hasError;
        }).timeout(
          const Duration(seconds: 5),
          onTimeout: () {
            fail(
              'UserLocationController did not enter error state within timeout.',
            );
          },
        );

        expect(find.byKey(kDialogDefaultKey), findsOneWidget);
        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();
      });
    });
  });
}
