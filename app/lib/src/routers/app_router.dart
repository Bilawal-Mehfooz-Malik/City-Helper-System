import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/features/categories_list/presentation/categories_list_screen.dart';
import 'package:app/src/routers/redirection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/startup/data/real/user_location_repository.dart';
import '../features/startup/presentation/pick_location/pick_location_screen.dart';
import '../features/startup/presentation/startup_content/startup_screen.dart';
import 'not_found_screen.dart';

part 'app_router.g.dart';

enum AppRoute {
  category,
  getStarted,
  permissionDenied,
  pickYourLocation,
  loading,
  pageNotFound,
}

@riverpod
GoRouter appRouter(Ref ref) {
  late GoRouter router;
  // Determine the initial route based on the user location state.
  final userLocation = ref.read(watchUserLocationProvider).value;
  final initialLocation = userLocation != null ? '/' : '/get-started';

  // listen for changes in userLocationProvider to refresh the router for redirection
  ref.listen(watchUserLocationProvider, (_, __) => router.refresh());

  return router = GoRouter(
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
        builder: (context, state) => const CategoriesListScreen(),
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
