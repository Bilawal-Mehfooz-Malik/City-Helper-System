import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Determines the correct redirection based on the user's location status.
String? redirection(Ref ref, GoRouterState state) {
  final userLocationState = ref.read(watchUserLocationProvider);
  final currentPath = state.uri.path;

  // Still loading? Show loading screen
  if (userLocationState.isLoading) {
    return currentPath != '/loading' ? '/loading' : null;
  }

  final hasUserLocation = userLocationState.value != null;

  // Allow user to pick location anytime — don't block access
  final isPickLocation = currentPath.contains('pick-your-location');

  if (hasUserLocation &&
      currentPath.startsWith('/get-started') &&
      !isPickLocation) {
    return '/';
  }

  if (!hasUserLocation && !currentPath.startsWith('/get-started')) {
    return '/get-started';
  }

  return null;
}
