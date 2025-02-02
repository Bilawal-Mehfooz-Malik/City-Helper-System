import 'package:flutter_test/flutter_test.dart';

import '../test/src/robot.dart';

void main() {
  setUpAll(() => WidgetController.hitTestWarningShouldBeFatal = true);
  testWidgets('Integration test - Flow 1', (tester) async {
    // * Note: All tests are wrapped with `runAsync` to prevent this error:
    // * A Timer is still pending even after the widget tree was disposed.
    await tester.runAsync(() async {
      final r = Robot(tester);
      await r.pumpMyApp();
      await r.startupRobot.tapGetStartedButton();
      r.startupRobot.expectModalBottomSheet();
      await r.startupRobot.tapGetCurrentButton();
      await r.startupRobot.tapSaveButton();
      r.startupRobot.expectHomeScreen();
    });
  });

  testWidgets('Integration test - Flow 2', (tester) async {
    // * Note: All tests are wrapped with `runAsync` to prevent this error:
    // * A Timer is still pending even after the widget tree was disposed.
    await tester.runAsync(() async {
      final r = Robot(tester);
      await r.pumpMyApp();
      await r.startupRobot.tapGetStartedButton();
      r.startupRobot.expectModalBottomSheet();
      await r.startupRobot.tapFromMapButton();
      await r.startupRobot.tapSearchBar();
      await r.startupRobot.putText();
      await r.startupRobot.tapSuggestion();
      await r.startupRobot.tapMyLocationButton();
      await r.startupRobot.tapFloatingCheckButton();
      await r.startupRobot.tapSaveButton();
      r.startupRobot.expectHomeScreen();
    });
  });
}
