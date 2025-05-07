import 'package:app/src/features/categories_list/presentation/categories_list_screen.dart';
import 'package:app/src/features/home/presentation/home_screen.dart';
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
  final router = r.categoriesRobot.router;
  await r.pumpMyAppFake(CategoriesListScreen(), router);
  await r.golden.precacheImages();
  return r;
}

void main() {
  final kMobileSize = Size(350, 600);
  final kDesktopSize = Size(1000, 1000);

  group('Golden - Home Screen', () {
    testWidgets('HomeScreen (Mobile)', (tester) async {
      // Setup environment and initial state
      final r = await _setupGoldenTestEnvironment(tester, kMobileSize);
      await expectLater(
        find.byType(CategoriesListScreen),
        matchesGoldenFile('Home/Mobile/1_category_screen.png'),
      );

      await r.categoriesRobot.tapCategory();
      r.categoriesRobot.expectHomeScreen();
      await expectLater(
        find.byType(HomeScreen),
        matchesGoldenFile('Home/Mobile/2_HomeScreen.png'),
      );
    }, tags: ['golden']);

    testWidgets('HomeScreen (Desktop)', (tester) async {
      // Setup environment and initial state
      final r = await _setupGoldenTestEnvironment(tester, kDesktopSize);

      await expectLater(
        find.byType(CategoriesListScreen),
        matchesGoldenFile('Home/Desktop/1_Categories_screen.png'),
      );

      await r.categoriesRobot.tapCategory();
      r.categoriesRobot.expectHomeScreen();
      await expectLater(
        find.byType(HomeScreen),
        matchesGoldenFile('Home/Desktop/2_HomeScreen .png'),
      );
    }, tags: ['golden']);
  });
}
