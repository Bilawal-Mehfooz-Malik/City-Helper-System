import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/features/startup/presentation/widgets/startup_bottom_sheet_content.dart';
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

  void expectSaveButton() {
    final finder = find.byKey(kSaveKey);
    expect(finder, findsOneWidget);
  }
}
