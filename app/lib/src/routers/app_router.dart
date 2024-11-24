import 'package:app/src/features/startup/presentation/screens/permission_denied_screen.dart';
import 'package:app/src/features/startup/presentation/screens/startup_screen.dart';
import 'package:app/src/features/home_screen.dart';
import 'package:app/src/routers/not_found_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home, getStarted, permissionDenied }

final appRouter = GoRouter(
  initialLocation: '/get-started',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/get-started',
      name: AppRoute.getStarted.name,
      builder: (context, state) => const StartupScreen(),
    ),
    GoRoute(
      path: '/permission-denied',
      name: AppRoute.permissionDenied.name,
      builder: (context, state) => const PermissionDeniedScreen(),
    ),
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
