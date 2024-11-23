import 'package:app/src/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'features/get_started/startup_robot.dart';
import 'goldens/golden_robot.dart';

class Robot {
  Robot(this.tester)
      : golden = GoldenRobot(tester),
        startupRobot = StartupRobot(tester);

  final WidgetTester tester;
  final GoldenRobot golden;
  final StartupRobot startupRobot;

  Future<void> pumpMyApp() async {
    // * Entry pont of App
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();
  }
}
