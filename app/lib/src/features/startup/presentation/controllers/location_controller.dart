import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/real/geolocator_repository.dart';

part 'location_controller.g.dart';

@riverpod
class LocationController extends _$LocationController {
  @override
  FutureOr<LatLng?> build() {
    return null;
  }

  Future<LatLng?> getCurrentLocation() async {
    state = const AsyncLoading();
    final locationRepo = ref.read(geoLocatorRepositoryProvider);
    state = await AsyncValue.guard(() => locationRepo.getCurrentLocation());
    return state.value;
  }

  void getLocationFromMap(LatLng location) async {
    state = const AsyncLoading();
    state = AsyncData(location);
  }
}
