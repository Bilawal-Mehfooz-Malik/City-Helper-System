import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/startup/domain/location_exceptions.dart';
import 'package:app/src/features/startup/presentation/controllers/location_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location_controller.g.dart';

@riverpod
class UserLocationController extends _$UserLocationController {
  @override
  FutureOr<void> build() {}

  Future<void> createUser() async {
    state = const AsyncLoading();
    final userLocation = ref.read(locationControllerProvider).value;

    if (userLocation == null) {
      state = AsyncError(LocationUnavailableException(), StackTrace.current);
      return;
    }

    final repository = ref.read(userLocationRepositoryProvider);
    state = await AsyncValue.guard(
      () => repository.setUserLocation(userLocation),
    );
  }
}
