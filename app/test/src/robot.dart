import 'package:app/src/core/app_bootstrap/app_bootstrap.dart';
import 'package:app/src/core/app_bootstrap/app_bootstrap_fakes.dart';
import 'package:app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'features/categories_list/categories_robot.dart';
import 'features/startup/startup_robot.dart';
import 'goldens/golden_robot.dart';

class Robot {
  Robot(this.tester)
    : startupRobot = StartupRobot(tester),
      categoriesRobot = CategoriesRobot(tester),
      golden = GoldenRobot(tester);

  final WidgetTester tester;
  final GoldenRobot golden;
  final StartupRobot startupRobot;
  final CategoriesRobot categoriesRobot;

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

  Future<void> pumpAppWithScreenSize(Size screenSize) async {
    tester.view.physicalSize = screenSize;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(
      () => {
        tester.view.resetPhysicalSize(),
        tester.view.resetDevicePixelRatio(),
      },
    );
    await pumpMyApp();
  }

  // Helper methods
  Future<void> pumpAppWithMobileScreen() async {
    await pumpAppWithScreenSize(Size(350, 600));
  }

  Future<void> pumpAppWithTabletScreen() async {
    await pumpAppWithScreenSize(Size(640, 800));
  }

  Future<void> pumpAppWithDesktopScreen() async {
    await pumpAppWithScreenSize(Size(1000, 1000));
  }
}
