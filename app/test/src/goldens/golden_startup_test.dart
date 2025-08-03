import 'package:app/src/features/categories_list/presentation/categories_list_screen.dart';
import 'package:app/src/features/startup/presentation/startup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart'; // Added for @isTest helper

import '../robot.dart';

@isTest
Future<Robot> _setupGoldenTestEnvironment(
  WidgetTester tester,
  Size size,
) async {
  final r = Robot(tester);
  await r.golden.setSurfaceSize(size);
  await r.golden.loadRobotoFont();
  await r.golden.loadMaterialIconFont();
  await r.pumpMyApp();
  await r.golden.precacheImages();
  return r;
}

void main() {
  final kMobileSize = Size(350, 600);
  final kDesktopSize = Size(1000, 1000);

  group('Golden - Startup Screen', () {
    testWidgets('Get Current Location (Mobile)', (tester) async {
      // Setup environment and initial state
      final r = await _setupGoldenTestEnvironment(tester, kMobileSize);
      await expectLater(
        find.byType(StartupScreen),
        matchesGoldenFile('startup/Mobile/1_startup_screen.png'),
      );

      await r.startupRobot.tapGetStartedButton();
      r.startupRobot.expectModalBottomSheet();
      await expectLater(
        find.byType(StartupScreen),
        matchesGoldenFile('startup/Mobile/2_bottom_sheet_opened.png'),
      );
      await r.startupRobot.tapGetCurrentButton();
      await expectLater(
        find.byType(StartupScreen),
        matchesGoldenFile('startup/Mobile/3_saved_current_location.png'),
      );
      await r.startupRobot.tapSaveButton();
      await expectLater(
        find.byType(CategoriesListScreen),
        matchesGoldenFile('startup/Mobile/4_categories_list_screen.png'),
      );
    }, tags: ['golden']);

    testWidgets('Get Current Location (Desktop)', (tester) async {
      // Setup environment and initial state
      final r = await _setupGoldenTestEnvironment(tester, kDesktopSize);

      await expectLater(
        find.byType(StartupScreen),
        matchesGoldenFile('startup/Desktop/1_startup_screen.png'),
      );

      await r.startupRobot.tapGetCurrentButton();
      await expectLater(
        find.byType(StartupScreen),
        matchesGoldenFile('startup/Desktop/2_saved_current_location.png'),
      );
      await r.startupRobot.tapSaveButton();
      await expectLater(
        find.byType(CategoriesListScreen),
        matchesGoldenFile('startup/Desktop/3_categories_list_screen.png'),
      );
    }, tags: ['golden']);
  });
}
