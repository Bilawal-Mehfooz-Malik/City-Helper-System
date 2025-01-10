import 'package:app/src/features/startup/domain/user_location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/geolocator_repository.dart';

part 'location_controller.g.dart';

@riverpod
class LocationController extends _$LocationController {
  @override
  FutureOr<UserLocation?> build() {
    return null;
  }

  Future<void> getCurrentLocation() async {
    state = const AsyncLoading();
    final locationRepo = ref.read(geoLocatorRepositoryProvider);
    state = await AsyncValue.guard(() => locationRepo.getCurrentLocation());
  }

  void getLocationFromMap(UserLocation location) async {
    state = const AsyncLoading();
    state = AsyncData(location);
  }
}
