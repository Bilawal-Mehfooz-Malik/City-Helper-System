import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/my_shop/data/user_mode_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

String? redirection(Ref ref, GoRouterState state) {
  final authRepository = ref.watch(authRepositoryProvider);
  final user = authRepository.currentUser;
  final isLoggedIn = user != null;

  final userLocationState = ref.read(watchUserLocationProvider);
  final currentPath = state.uri.path;

  // Step 1: Loading (unchanged)
  if (userLocationState.isLoading) {
    return currentPath != '/loading' ? '/loading' : null;
  }

  // Step 2: Onboarding - No Location (unchanged)
  final hasUserLocation = userLocationState.value != null;
  if (!hasUserLocation && !currentPath.startsWith('/get-started')) {
    return '/get-started';
  }

  // Step 3: Handle Auth State (modified)
  if (!isLoggedIn) {
    if (currentPath == '/account' ||
        currentPath == '/profile' ||
        currentPath.startsWith('/my-shop')) {
      return '/'; // If not logged in, block account, profile, and admin pages.
    }
  } else {
    // All logic for a logged-in user goes here.

    // FIX: Add logic for startup redirection based on user mode.
    // This is the key logic for starting the app on the correct screen.
    // We only perform this check if the user is at the root of the app ('/').
    if (currentPath == '/') {
      // Read the mode directly from the repository (it's synchronous).
      final isAdminMode = ref.read(userModeRepositoryProvider).getIsAdminMode();
      if (isAdminMode) {
        // If in admin mode, redirect from the user homepage to the admin dashboard.
        return '/my-shop';
      }
    }

    // Profile completion logic (unchanged)
    final userProfile = ref.read(getUserByIdProvider(user.uid)).value;
    final isProfileComplete =
        userProfile != null && userProfile.name.trim().isNotEmpty;
    if (currentPath == '/auth') {
      return isProfileComplete ? '/' : '/profile';
    }
  }

  // Step 4: Onboarding Block (unchanged)
  final isPickLocation = currentPath.contains('pick-your-location');
  if (hasUserLocation &&
      currentPath.startsWith('/get-started') &&
      !isPickLocation) {
    return '/';
  }

  return null; // No redirection needed.
}
