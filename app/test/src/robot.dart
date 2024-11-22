import 'package:app/src/app.dart';
import 'package:flutter_test/flutter_test.dart';

import 'goldens/golden_robot.dart';

class Robot {
  Robot(this.tester) : golden = GoldenRobot(tester);
  final WidgetTester tester;
  final GoldenRobot golden;

  Future<void> pumpMyApp() async {
    // * Entry pont of App
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
  }
}
