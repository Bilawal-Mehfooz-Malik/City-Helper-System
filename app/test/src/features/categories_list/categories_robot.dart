import 'package:app/src/features/categories_list/presentation/categories_list_screen.dart';
import 'package:app/src/features/categories_list/presentation/category_card.dart';
import 'package:flutter_test/flutter_test.dart';

class CategoriesRobot {
  CategoriesRobot(this.tester);
  final WidgetTester tester;

  void expectCategoriesScreen() {
    final finder = find.byType(CategoriesListScreen);
    expect(finder, findsOneWidget);
  }

  Future<void> tapCategory() async {
    final finder = find.byType(CategoryCard).first;
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }
}
