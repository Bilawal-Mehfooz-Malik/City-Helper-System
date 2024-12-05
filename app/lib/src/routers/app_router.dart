import 'package:app/src/core/common_widgets/loading_screen.dart';
import 'package:app/src/routers/initial_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/home_screen.dart';
import '../features/startup/presentation/screens/permission_denied_screen.dart';
import '../features/startup/presentation/screens/pick_your_location_screen.dart';
import '../features/startup/presentation/screens/startup_screen.dart';
import 'not_found_screen.dart';

part 'app_router.g.dart';

enum AppRoute {
  home,
  getStarted,
  permissionDenied,
  pickYourLocation,
  loading,
  pageNotFound
}

@riverpod
GoRouter appRouter(Ref ref) {
  final userExistsAsyncValue = ref.watch(userLocationExistsProvider);

  // Set initialLocation based on the FutureProvider's state
  final initialLocation = userExistsAsyncValue.when(
    loading: () => '/loading',
    error: (err, stack) => '/page-not-found',
    data: (userProfileExists) => userProfileExists ? '/' : '/get-started',
  );

  return GoRouter(
    initialLocation: initialLocation,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/get-started',
        name: AppRoute.getStarted.name,
        builder: (context, state) => const StartupScreen(),
        routes: [
          GoRoute(
            path: '/pick-your-location',
            name: AppRoute.pickYourLocation.name,
            pageBuilder: (context, state) {
              return const MaterialPage(
                fullscreenDialog: true,
                child: PickYourLocationScreen(),
              );
            },
            routes: [
              GoRoute(
                path: '/permission-denied',
                name: AppRoute.permissionDenied.name,
                builder: (context, state) => const PermissionDeniedScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/loading',
        name: AppRoute.loading.name,
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: '/page-not-found',
        name: AppRoute.pageNotFound.name,
        builder: (context, state) => const NotFoundScreen(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
