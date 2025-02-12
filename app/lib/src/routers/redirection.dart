import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Determines the correct redirection based on the user's location status.
String? redirection(Ref ref, GoRouterState state) {
  // Retrieve the current user location state.
  final userLocationState = ref.read(watchUserLocationProvider);
  final currentPath = state.uri.path;

  // If the user location is still loading, redirect to the loading page unless already there.
  if (userLocationState.isLoading) {
    return currentPath != '/loading' ? '/loading' : null;
  }

  // Check if the user location data is available.
  final bool hasUserLocation = userLocationState.value != null;
  final bool isOnGetStartedPage = currentPath.startsWith('/get-started');

  // If location exists and the user is on the loading or get-started page,
  // redirect them to the home page.
  if (hasUserLocation && (isOnGetStartedPage || currentPath == '/loading')) {
    return '/';
  }

  // If location data is missing and the user is not on the get-started page,
  // redirect them to the get-started page.
  if (!hasUserLocation && !isOnGetStartedPage) {
    return '/get-started';
  }

  // No redirection is needed.
  return null;
}
