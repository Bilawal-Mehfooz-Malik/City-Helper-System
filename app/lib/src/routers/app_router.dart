import 'package:app/src/features/startup/domain/user_location_repository.dart';
import 'package:app/src/routers/go_router_refresh_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/common_widgets/loading_screen.dart';
import '../features/home_screen.dart';
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
  pageNotFound,
}

@riverpod
GoRouter appRouter(Ref ref) {
  final userLocRepo = ref.watch(userLocationRepositoryProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(userLocRepo.watchUserLocation()),
    redirect: (context, state) {
      final location = state.uri.path;
      final userLocationAsyncValue = ref.watch(watchUserLocationProvider);

      return userLocationAsyncValue.when(
        data: (userExists) {
          if (userExists == null) {
            // User does not exist, redirect to /get-started
            if (location != '/get-started' &&
                !location.startsWith('/get-started')) {
              return '/get-started';
            }
          } else {
            // User exists, prevent access to /get-started and redirect to home
            if (location == '/get-started' ||
                location.startsWith('/get-started') ||
                location == '/loading') {
              return '/';
            }
          }
          return null; // No redirect
        },
        loading: () {
          // If data is loading, redirect to the loading screen
          if (location != '/loading') {
            return '/loading';
          }
          return null; // Stay on the loading screen
        },
        error: (error, stack) {
          // Handle errors by redirecting to the error page
          if (location != '/page-not-found') return '/page-not-found';
          return null;
        },
      );
    },
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
                child: PickYourLocationScreen(),
              );
            },
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
