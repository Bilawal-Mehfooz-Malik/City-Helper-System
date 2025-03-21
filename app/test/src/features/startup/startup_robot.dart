import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/features/categories_list/presentation/categories_list_screen.dart';
import 'package:app/src/features/startup/presentation/pick_location/search_bar/pick_location_search_bar.dart';
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

  void expectCategoriesListScreen() {
    final finder = find.byKey(kCategoriesListScreen);
    expect(finder, findsOneWidget);
  }

  // Only for [Flow 2]
  Future<void> tapFromMapButton() async {
    final finder = find.byKey(kFromMapKey);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> tapSearchBar() async {
    final finder = find.byType(PickLocationSearchBar);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> putText() async {
    final finder = find.widgetWithText(TextField, 'Enter City Name');
    expect(finder, findsOneWidget);
    await tester.enterText(finder, 'test');
    await tester.pumpAndSettle();
  }

  Future<void> tapSuggestion() async {
    final finder = find.byType(ListTile);
    expect(finder, findsWidgets);
    await tester.pumpAndSettle();
    await tester.tap(finder.first);
    await tester.pumpAndSettle();
  }

  Future<void> tapMyLocationButton() async {
    final finder = find.byIcon(Icons.my_location);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }
}
