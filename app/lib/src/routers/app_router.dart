import 'package:app/src/features/home_screen.dart';
import 'package:app/src/routers/not_found_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home }

final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
