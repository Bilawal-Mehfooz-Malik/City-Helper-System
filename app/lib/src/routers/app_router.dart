import 'package:app/src/features/get_started/get_started_screen.dart';
import 'package:app/src/features/home_screen.dart';
import 'package:app/src/routers/not_found_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home, getStarted }

final appRouter = GoRouter(
  initialLocation: '/get-started',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/get-started',
      name: AppRoute.getStarted.name,
      builder: (context, state) => const GetStartedScreen(),
    ),
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
