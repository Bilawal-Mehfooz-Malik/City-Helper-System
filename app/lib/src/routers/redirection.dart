import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/my_shop/data/user_mode_repository.dart';
import 'package:app/src/features/pick_location/data/real/user_location_repository.dart';
import 'package:app/src/features/auth/data/user_repository.dart';

/// Redirection logic for GoRouter
Future<String?> redirection(Ref ref, GoRouterState state) async {
  final currentPath = state.uri.path;

  // 1️⃣ Handle user location
  final userLocationState = ref.watch(fetchUserLocationProvider);

  if (userLocationState.isLoading) {
    return null; // let page show its own loader
  }

  final hasLocation =
      userLocationState.hasValue && userLocationState.value != null;

  if (!hasLocation &&
      !currentPath.startsWith('/get-started') &&
      !currentPath.startsWith('/terms-of-service') &&
      !currentPath.startsWith('/privacy-policy')) {
    return '/get-started';
  }

  if (hasLocation && currentPath.startsWith('/get-started')) {
    return '/';
  }

  // 2️⃣ Auth check
  final authUser = ref.watch(authRepositoryProvider).currentUser;
  final isLoggedIn = authUser != null;

  // 🚫 Prevent logged-in users from accessing /auth pages
  if (isLoggedIn && currentPath.startsWith('/auth')) {
    final isAdmin = ref.read(userModeRepositoryProvider).getIsAdminMode();
    return isAdmin ? '/my-shop' : '/';
  }

  if (!isLoggedIn) {
    // Restrict access to protected pages for logged-out users
    if (currentPath.startsWith('/account') ||
        currentPath.startsWith('/profile') ||
        currentPath.startsWith('/my-shop')) {
      return '/';
    }
    return null; // allow public pages
  }

  // 3️⃣ Profile check
  final userProfile = await ref.watch(getUserByIdProvider(authUser.uid).future);

  final hasProfile = userProfile != null && userProfile.name.trim().isNotEmpty;

  if (!hasProfile && currentPath != '/profile') {
    return '/profile';
  }

  // 4️⃣ Admin mode routing
  final isAdmin = ref.read(userModeRepositoryProvider).getIsAdminMode();

  if (isAdmin) {
    if (!currentPath.startsWith('/my-shop') &&
        currentPath != '/profile' &&
        currentPath != '/account' &&
        currentPath != '/pick-your-location') {
      return '/my-shop';
    }
  } else {
    // Normal users cannot access admin pages
    if (currentPath.startsWith('/my-shop')) return '/';
  }

  // ✅ Already on correct route
  return null;
}
