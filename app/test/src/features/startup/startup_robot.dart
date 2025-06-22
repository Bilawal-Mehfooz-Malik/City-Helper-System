import 'package:app/src/features/startup/presentation/widgets/get_location_content.dart';
import 'package:app/src/features/startup/presentation/widgets/startup_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class StartupRobot {
  StartupRobot(this.tester);
  final WidgetTester tester;

  Future<void> tapGetStartedButton() async {
    final finder = find.byKey(kGetStartedKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  void expectModalBottomSheet() {
    final finder = find.byType(GetLocationContent);
    expect(finder, findsOneWidget);
  }

  Future<void> tapGetCurrentButton() async {
    final finder = find.byKey(kGetCurrentKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> tapSaveButton() async {
    final finder = find.byKey(kSaveKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  // Only for [Flow 2]
  Future<void> tapFromMapButton() async {
    final finder = find.byKey(kFromMapKey);
    expect(finder, findsOneWidget);
    await tester.ensureVisible(finder);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> tapMyLocationButton() async {
    final finder = find.byIcon(Icons.my_location);
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
}
