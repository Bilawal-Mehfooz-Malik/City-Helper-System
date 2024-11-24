import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/fake_location_repository.dart';

part 'location_controller.g.dart';

@riverpod
class LocationController extends _$LocationController {
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
        await AsyncValue.guard(() => locationRepository.getCurrentLocation());
  }
}
