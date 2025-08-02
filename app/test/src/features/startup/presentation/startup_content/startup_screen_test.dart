import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/src/features/startup/presentation/widgets/get_location_content.dart';
import 'package:app/src/features/startup/presentation/widgets/startup_content.dart';
import '../../../../robot.dart';

void main() {
  testWidgets('startup started screen (Mobile Screen) - Flow 1', (
    tester,
  ) async {
    final r = Robot(tester);
    await r.pumpAppWithMobileScreen();
    // Check if StartupScreen is present
    if (find.byKey(kGetStartedKey).evaluate().isNotEmpty) {
      await r.startupRobot.tapGetStartedButton();
      r.startupRobot.expectModalBottomSheet();
      await r.startupRobot.tapGetCurrentButton();
      await r.startupRobot.tapSaveButton();
    }
    r.categoriesRobot.expectCategoriesScreen();
  });

  testWidgets('startup started screen (Desktop Screen) - Flow 1', (
    tester,
  ) async {
    final r = Robot(tester);
    await r.pumpAppWithDesktopScreen();
    // Check if StartupScreen is present
    if (find.byKey(kGetCurrentKey).evaluate().isNotEmpty) {
      await r.startupRobot.tapGetCurrentButton();
      await r.startupRobot.tapSaveButton();
    }
    r.categoriesRobot.expectCategoriesScreen();
  });

  testWidgets('startup started screen (Mobile Screen) - Flow 2', (
    tester,
  ) async {
    final r = Robot(tester);
    await r.pumpAppWithMobileScreen();
    // Check if StartupScreen is present
    if (find.byKey(kGetStartedKey).evaluate().isNotEmpty) {
      await r.startupRobot.tapGetStartedButton();
      r.startupRobot.expectModalBottomSheet();
      await r.startupRobot.tapFromMapButton();
      await r.startupRobot.tapMyLocationButton();
      await r.startupRobot.tapFloatingCheckButton();
      await r.startupRobot.tapSaveButton();
    }
    r.categoriesRobot.expectCategoriesScreen();
  });

  testWidgets('startup started screen (Desktop Screen) - Flow 2', (
    tester,
  ) async {
    final r = Robot(tester);
    await r.pumpAppWithDesktopScreen();
    // Check if StartupScreen is present
    if (find.byKey(kFromMapKey).evaluate().isNotEmpty) {
      await r.startupRobot.tapFromMapButton();
      await r.startupRobot.tapMyLocationButton();
      await r.startupRobot.tapFloatingCheckButton();
      await r.startupRobot.tapSaveButton();
    }
    r.categoriesRobot.expectCategoriesScreen();
  });
}
