import 'package:flutter_test/flutter_test.dart';

import '../../../../robot.dart';

void main() {
  testWidgets('startup started screen (Mobile Screen) - Flow 1', (
    tester,
  ) async {
    final r = Robot(tester);
    await r.pumpAppWithMobileScreen();
    await r.startupRobot.tapGetStartedButton();
    r.startupRobot.expectModalBottomSheet();
    await r.startupRobot.tapGetCurrentButton();
    await r.startupRobot.tapSaveButton();
    r.categoriesRobot.expectCategoriesScreen();
  });

  testWidgets('startup started screen (Desktop Screen) - Flow 1', (
    tester,
  ) async {
    final r = Robot(tester);
    await r.pumpAppWithDesktopScreen();
    await r.startupRobot.tapGetCurrentButton();
    await r.startupRobot.tapSaveButton();
    r.categoriesRobot.expectCategoriesScreen();
  });

  testWidgets('startup started screen (Mobile Screen) - Flow 2', (
    tester,
  ) async {
    final r = Robot(tester);
    await r.pumpAppWithMobileScreen();
    await r.startupRobot.tapGetStartedButton();
    r.startupRobot.expectModalBottomSheet();
    await r.startupRobot.tapFromMapButton();
    await r.startupRobot.tapMyLocationButton();
    await r.startupRobot.tapFloatingCheckButton();
    await r.startupRobot.tapSaveButton();
    r.categoriesRobot.expectCategoriesScreen();
  });

  testWidgets('startup started screen (Desktop Screen) - Flow 2', (
    tester,
  ) async {
    final r = Robot(tester);
    await r.pumpAppWithDesktopScreen();
    await r.startupRobot.tapFromMapButton();
    await r.startupRobot.tapMyLocationButton();
    await r.startupRobot.tapFloatingCheckButton();
    await r.startupRobot.tapSaveButton();
    r.categoriesRobot.expectCategoriesScreen();
  });
}
