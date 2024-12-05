import 'package:app/src/features/startup/data/location_repository.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_controller.g.dart';

@riverpod
class LocationController extends _$LocationController {
  @override
  FutureOr<LatLng?> build() {
    return null;
  }

  Future<void> getCurrentLocation() async {
    state = const AsyncLoading();
    final locationRepo = ref.read(locationRepositoryProvider);
    state = await AsyncValue.guard(() => locationRepo.getCurrentLocation());
  }

  void getLocationFromMap(LatLng latLng) {
    state = const AsyncLoading();
    final locationRepo = ref.read(locationRepositoryProvider);
    state = AsyncData(locationRepo.getLocationFromMap(latLng));
  }
}
