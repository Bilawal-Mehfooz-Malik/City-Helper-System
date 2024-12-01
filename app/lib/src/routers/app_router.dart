import 'package:app/src/features/startup/presentation/screens/pick_your_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/home_screen.dart';
import '../features/startup/presentation/screens/permission_denied_screen.dart';
import '../features/startup/presentation/screens/startup_screen.dart';
import 'not_found_screen.dart';

part 'app_router.g.dart';

enum AppRoute { home, getStarted, permissionDenied, pickYourLocation }

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/get-started',
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
              ]),
        ],
      ),
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
