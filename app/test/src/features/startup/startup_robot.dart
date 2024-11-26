import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:flutter_test/flutter_test.dart';

class StartupRobot {
  StartupRobot(this.tester);
  final WidgetTester tester;

  void expectGetStartedButton() {
    final finder = find.byType(PrimaryButton);
    expect(finder, findsOneWidget);
  }
}
