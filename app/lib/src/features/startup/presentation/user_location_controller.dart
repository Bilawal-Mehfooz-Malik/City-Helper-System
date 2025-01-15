import 'package:app/src/features/startup/data/user_location_repository.dart';
import 'package:app/src/features/startup/domain/location_exceptions.dart';
import 'package:app/src/features/startup/presentation/location_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location_controller.g.dart';

@riverpod
class UserLocationController extends _$UserLocationController {
  @override
  FutureOr<void> build() {}

  Future<void> createUser() async {
    state = const AsyncLoading();
    final locationController = ref.read(locationControllerProvider);

    // Checking if the location is available; handle null case gracefully
    final userLocation = locationController.maybeWhen(
      data: (location) => location,
      error: (e, s) {
        debugPrint('--- Location Not Availabe Exception ---\n'
            'Error: $e\n'
            'Stack Trace:\n$s\n'
            '------------------------------');
      },
      orElse: () => null,
    );

    if (userLocation == null) {
      state = AsyncError(LocationUnavailableException(), StackTrace.current);
      return;
    }

    final repository = ref.read(userLocationRepositoryProvider);
    state =
        await AsyncValue.guard(() => repository.setUserLocation(userLocation));
  }
}
