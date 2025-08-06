import 'package:app/src/features/categories_list/presentation/categories_list_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import '../../robot.dart';

void main() {
  testWidgets('CategoriesListScreen golden test', (tester) async {
    final r = Robot(tester);
    await r.golden.loadMaterialIconFont();
    await r.golden.loadRobotoFont();

    final fakeRouter = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const CategoriesListScreen(),
        ),
      ],
    );

    await r.pumpMyAppFakeWithMobileScreen(
      const CategoriesListScreen(),
      fakeRouter,
    );

    await r.golden.precacheImages();

    await expectLater(
      find.byType(CategoriesListScreen),
      matchesGoldenFile('goldens/categories_list_screen_mobile.png'),
    );
  });

  testWidgets('CategoriesListScreen golden test (Desktop)', (tester) async {
    final r = Robot(tester);
    await r.golden.loadMaterialIconFont();
    await r.golden.loadRobotoFont();

    final fakeRouter = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const CategoriesListScreen(),
        ),
      ],
    );

    await r.pumpMyAppFakeWithDesktopScreen(
      const CategoriesListScreen(),
      fakeRouter,
    );

    await r.golden.precacheImages();

    await expectLater(
      find.byType(CategoriesListScreen),
      matchesGoldenFile('goldens/categories_list_screen_desktop.png'),
    );
  });
}
