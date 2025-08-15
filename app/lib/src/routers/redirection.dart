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
    if (currentPath == '/') {
      final isAdminMode = ref.read(userModeRepositoryProvider).getIsAdminMode();
      if (isAdminMode) {
        return '/my-shop';
      }
    }

    final userProfile = ref.read(getUserByIdProvider(user.uid)).value;
    final isProfileComplete =
        userProfile != null && userProfile.name.trim().isNotEmpty;
    if (currentPath == '/auth') {
      return isProfileComplete ? '/' : '/profile';
    }
  }

  return null;
}