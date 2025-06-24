import 'package:app/src/features/auth/data/auth_repository.dart';
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

  if (userLocationState.isLoading) {
    return currentPath != '/loading' ? '/loading' : null;
  }

  final hasUserLocation = userLocationState.value != null;
  final isPickLocation = currentPath.contains('pick-your-location');

  // Step 1: Block if no location
  if (!hasUserLocation && !currentPath.startsWith('/get-started')) {
    return '/get-started';
  }

  // Step 2: Handle auth state
  if (!isLoggedIn) {
    if (currentPath == '/account' || currentPath == '/profile') {
      return '/';
    }
  } else {
    // Check profile completion
    final userProfile = ref.read(getUserByIdProvider(user.uid)).value;

    final isProfileComplete =
        userProfile != null && userProfile.name.trim().isNotEmpty;

    // If on auth screen and profile incomplete, go to profile
    if (currentPath == '/auth') {
      return isProfileComplete ? '/' : '/profile';
    }

    // Block access to /auth if already logged in
    if (currentPath == '/auth') return '/';
  }

  // Step 3: If location is selected, block /get-started
  if (hasUserLocation &&
      currentPath.startsWith('/get-started') &&
      !isPickLocation) {
    return '/';
  }

  return null;
}
