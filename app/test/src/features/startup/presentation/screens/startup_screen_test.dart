import 'package:flutter_test/flutter_test.dart';

import '../../../../robot.dart';

void main() {
  testWidgets('startup started screen', (tester) async {
    final r = Robot(tester);
    await r.pumpMyApp();
    r.startupRobot.expectGetStartedButton();
  });
}
