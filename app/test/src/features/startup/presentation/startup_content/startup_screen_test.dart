import 'package:flutter_test/flutter_test.dart';

import '../../../../robot.dart';

void main() {
  testWidgets('startup started screen - Flow 1', (tester) async {
    final r = Robot(tester);
    await r.pumpMyApp();
    await r.startupRobot.tapGetStartedButton();
    r.startupRobot.expectModalBottomSheet();
    await r.startupRobot.tapGetCurrentButton();
    await r.startupRobot.tapSaveButton();
    r.startupRobot.expectHomeScreen();
  });

  testWidgets('startup started screen - Flow 2', (tester) async {
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
}
