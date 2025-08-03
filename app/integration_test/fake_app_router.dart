import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/startup/presentation/pick_location_screen.dart';
import 'package:app/src/features/startup/presentation/startup_screen.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:app/src/routers/not_found_screen.dart';
import 'package:app/src/routers/redirection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final fakeAppRouterProvider = Provider<GoRouter>((ref) {
  late GoRouter router;

  final userLocation = ref.watch(fetchUserLocationProvider).value;
  final initialLocation = userLocation != null ? '/' : '/get-started';

  ref.listen(fetchUserLocationProvider, (_, _) => router.refresh());

  router = GoRouter(
    initialLocation: initialLocation,
    debugLogDiagnostics: true,
    redirect: (context, state) => redirection(ref, state),
    routes: [
      GoRoute(
        path: '/get-started',
        name: AppRoute.getStarted.name,
        builder: (context, state) => const StartupScreen(),
        routes: [
          GoRoute(
            path: 'pick-your-location',
            name: AppRoute.pickYourLocation.name,
            pageBuilder: (context, state) {
              return const MaterialPage(
                fullscreenDialog: true,
                child: PickLocationScreen(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/',
        name: AppRoute.category.name,
        builder: (context, state) => const SizedBox.shrink(), // Mock screen
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
  return router;
});
