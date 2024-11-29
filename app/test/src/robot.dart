import 'package:app/app_bootstrap_fakes.dart';
import 'package:app/src/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'features/startup/startup_robot.dart';
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
    final container = await createFakesProviderContainer();
    final root = UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    );
    await tester.pumpWidget(root);
    await tester.pumpAndSettle();
  }
}
