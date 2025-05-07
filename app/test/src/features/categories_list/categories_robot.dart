import 'package:app/src/features/categories_list/presentation/categories_list_screen.dart';
import 'package:app/src/features/categories_list/presentation/widgets/category_card.dart';
import 'package:app/src/features/home/presentation/home_screen.dart';
import 'package:app/src/features/home/presentation/widgets/entity_card.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

class CategoriesRobot {
  CategoriesRobot(this.tester);
  final WidgetTester tester;

  GoRouter get router => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.category.name,
        builder: (context, state) => const CategoriesListScreen(),
        routes: [
          GoRoute(
            path: '/home/:categoryId',
            name: AppRoute.home.name,
            builder: (context, state) {
              final id = int.parse(state.pathParameters['categoryId']!);
              return HomeScreen(categoryId: id);
            },
          ),
        ],
      ),
    ],
  );

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

  void expectHomeScreen() {
    final finder = find.byType(HomeScreen);
    expect(finder, findsOneWidget);
  }

  void expectItemCard() {
    final finder = find.byType(EntityCard).first;
    expect(finder, findsOneWidget);
  }
}
