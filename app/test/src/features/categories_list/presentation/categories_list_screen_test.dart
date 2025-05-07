import 'package:app/src/features/categories_list/presentation/categories_list_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../robot.dart';

void main() {
  testWidgets('Categories List Screen (Mobile Screen)', (tester) async {
    final r = Robot(tester);
    final router = r.categoriesRobot.router;
    await r.pumpMyAppFakeWithMobileScreen(CategoriesListScreen(), router);
    r.categoriesRobot.expectCategoriesScreen();
    await r.categoriesRobot.tapCategory();
    r.categoriesRobot.expectHomeScreen();
    r.categoriesRobot.expectItemCard();
  });

  testWidgets('Categories List Screen (Desktop Screen)', (tester) async {
    final r = Robot(tester);
    final router = r.categoriesRobot.router;
    await r.pumpMyAppFakeWithDesktopScreen(CategoriesListScreen(), router);
    r.categoriesRobot.expectCategoriesScreen();
    await r.categoriesRobot.tapCategory();
    r.categoriesRobot.expectHomeScreen();
    r.categoriesRobot.expectItemCard();
  });
}
