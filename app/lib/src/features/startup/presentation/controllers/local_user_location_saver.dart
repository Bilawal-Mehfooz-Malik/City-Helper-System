import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/startup/domain/location_exceptions.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_user_location_saver.g.dart';

@riverpod
class LocalUserLocationSaver extends _$LocalUserLocationSaver {
  @override
  FutureOr<void> build() {}

  Future<void> createUser() async {
    state = const AsyncLoading();
    final userLocation = ref.read(userLocationControllerProvider).value;

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
