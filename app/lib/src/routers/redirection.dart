import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Determines the correct redirection based on the user's location status.
String? redirection(Ref ref, GoRouterState state) {
  final userLocationState = ref.read(watchUserLocationProvider);
  final currentPath = state.uri.path;

  // If location is still loading, redirect to the loading page
  if (userLocationState.isLoading) {
    return currentPath != '/loading' ? '/loading' : null;
  }

  // Check if location is available
  final hasUserLocation = userLocationState.value != null;

  // Redirect to home if the user has location but is on the get-started page
  if (hasUserLocation && currentPath.startsWith('/get-started')) {
    return '/';
  }

  // Redirect to get-started if no location is available
  if (!hasUserLocation && !currentPath.startsWith('/get-started')) {
    return '/get-started';
  }

  // No redirection needed
  return null;
}
