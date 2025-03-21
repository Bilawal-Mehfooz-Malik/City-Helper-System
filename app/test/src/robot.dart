import 'package:app/app_bootstrap.dart';
import 'package:app/app_bootstrap_fakes.dart';
import 'package:app/src/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'features/startup/startup_robot.dart';
import 'goldens/golden_robot.dart';

class Robot {
  Robot(this.tester)
    : startupRobot = StartupRobot(tester),
      golden = GoldenRobot(tester);

  final WidgetTester tester;
  final GoldenRobot golden;
  final StartupRobot startupRobot;

  Future<void> pumpMyApp() async {
    // * Entry pont of App
    final appBootStrap = AppBootStrap();
    final container = appBootStrap.createFakeProviderContainer();
    final root = UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    );
    await tester.pumpWidget(root);
    await tester.pumpAndSettle();
  }
}
