import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/startup/domain/location_exceptions.dart';
import 'package:app/src/features/startup/presentation/location_controller.dart';
import 'package:app/src/localization/string_hardcoded.dart';
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
        AppLogger.logError(
          ('Location is not available in location controller'.hardcoded),
          error: e,
          stackTrace: s,
        );
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
