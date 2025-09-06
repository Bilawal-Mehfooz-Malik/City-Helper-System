import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/my_shop/data/user_mode_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

String? redirection(Ref ref, GoRouterState state) {
  final userLocationState = ref.watch(fetchUserLocationProvider);
  final currentPath = state.uri.path;

  // 1. Handle loading state
  if (userLocationState.isLoading) {
    return currentPath != '/loading' ? '/loading' : null;
  }

  final hasUserLocation = userLocationState.value != null;

  // 2. If user has location, but is on startup screen, redirect them.
  if (hasUserLocation && currentPath.startsWith('/get-started')) {
    final isLoggedIn = ref.watch(authRepositoryProvider).currentUser != null;
    if (isLoggedIn) {
      final isAdminMode = ref.read(userModeRepositoryProvider).getIsAdminMode();
      return isAdminMode ? '/my-shop' : '/';
    } else {
      return '/';
    }
  }

  // 3. If user has NO location, and is NOT on startup screen, redirect them.
  if (!hasUserLocation && !currentPath.startsWith('/get-started')) {
    return '/get-started';
  }

  // 4. Handle other auth-based redirects
  final authRepository = ref.watch(authRepositoryProvider);
  final user = authRepository.currentUser;
  final isLoggedIn = user != null;

  if (!isLoggedIn) {
    if (currentPath == '/account' ||
        currentPath == '/profile' ||
        currentPath.startsWith('/my-shop')) {
      return '/';
    }
  } else {
    // User is logged in
    final userProfileValue = ref.watch(getUserByIdProvider(user.uid));
    final userProfile = userProfileValue.value;
    final isProfileComplete =
        userProfile != null && userProfile.name.trim().isNotEmpty;

    // If profile is incomplete, redirect to profile screen
    if (!isProfileComplete) {
      if (currentPath != '/profile' && currentPath != '/auth') {
        if (userProfileValue.isLoading) {
          return null;
        }
        return '/profile';
      }
    } else {
      // Profile is complete
      // Handle admin mode redirection
      final isAdminMode = ref.read(userModeRepositoryProvider).getIsAdminMode();
      if (isAdminMode) {
        if (!currentPath.startsWith('/my-shop') &&
            currentPath != '/account' &&
            currentPath != '/profile' &&
            currentPath != '/pick-your-location') {
          return '/my-shop';
        }
      } else {
        // Not admin mode
        if (currentPath.startsWith('/my-shop')) {
          return '/';
        }
      }
    }
  }

  return null;
}
