import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/fake_location_repository.dart';

part 'user_location_controller.g.dart';

@riverpod
class UserLocationController extends _$UserLocationController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<void> getCurrentLocation() async {
    state = const AsyncLoading();
    final locationRepository = ref.read(fakeLocationRepositoryProvider);
    state =
        await AsyncValue.guard(() => locationRepository.getCurrentLocation());
  }

  Future<void> getLocationFromMap() async {
    state = const AsyncLoading();
    final locationRepository = ref.read(fakeLocationRepositoryProvider);
    state =
        await AsyncValue.guard(() => locationRepository.getLocationFromMap());
  }
}
