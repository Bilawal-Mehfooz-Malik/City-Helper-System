import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/features/home_screen.dart';
import 'package:app/src/features/startup/presentation/startup_content/startup_bottom_sheet_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class StartupRobot {
  StartupRobot(this.tester);
  final WidgetTester tester;

  Future<void> tapGetStartedButton() async {
    final finder = find.byType(PrimaryButton);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  void expectModalBottomSheet() {
    final finder = find.byType(StartupBottomSheetContent);
    expect(finder, findsOneWidget);
  }

  Future<void> tapGetCurrentButton() async {
    final finder = find.byKey(kGetCurrentKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> tapFromMapButton() async {
    final finder = find.byKey(kFromMapKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> tapFloatingCheckButton() async {
    final finder = find.byIcon(Icons.check);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> tapSaveButton() async {
    final finder = find.byKey(kSaveKey);
    expect(finder, findsOneWidget);
    await tester.ensureVisible(finder);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  void expectHomeScreen() {
    final finder = find.byKey(kHomeScreenKey);
    expect(finder, findsOneWidget);
  }
}
