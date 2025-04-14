import 'package:flutter_test/flutter_test.dart';

import '../../../robot.dart';

void main() {
  testWidgets('Categories List Screen (Mobile Screen) - Flow 1', (
    tester,
  ) async {
    // This test is for the startup screen on mobile devices.
    final r = Robot(tester);
    await r.pumpAppWithMobileScreen();
    await r.startupRobot.tapGetStartedButton();
    r.startupRobot.expectModalBottomSheet();
    await r.startupRobot.tapGetCurrentButton();
    await r.startupRobot.tapSaveButton();
    // The test of categories list screen starts here
    r.categoriesRobot.expectCategoriesScreen();
    await r.categoriesRobot.tapCategory();
  });
}
