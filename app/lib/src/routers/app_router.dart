import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/common_widgets/loading_screen.dart';
import '../features/home_screen.dart';
import '../features/startup/data/user_location_repository.dart';
import '../features/startup/presentation/pick_location/pick_location_screen.dart';
import '../features/startup/presentation/startup_content/startup_screen.dart';
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
  late GoRouter router;

  final sub =
      ref.listen(watchUserLocationProvider, (_, __) => router.refresh());

  return router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final location = state.uri.path;
      try {
        final userLocExists = sub.read().value;
        if (userLocExists == null) {
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
        return null;
      } catch (e) {
        if (location != '/page-not-found') return '/page-not-found';
        return null;
      }
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
                child: PickLocationScreen(),
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
