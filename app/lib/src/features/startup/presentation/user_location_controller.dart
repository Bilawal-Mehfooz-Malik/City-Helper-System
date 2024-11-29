import 'package:app/src/features/startup/domain/geo_location.dart';
import 'package:app/src/features/startup/domain/user_location_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location_controller.g.dart';

@riverpod
class UserLocationController extends _$UserLocationController {
  @override
  FutureOr<GeoLocation?> build() {
    return null;
  }

  Future<void> getCurrentLocation() async {
    state = const AsyncLoading();
    final userLocationRepository = ref.watch(userLocationRepositoryProvider);
    state = await AsyncValue.guard(
        () => userLocationRepository.getCurrentLocation());
  }

  Future<void> getLocationFromMap() async {
    state = const AsyncLoading();
    final userLocationRepository = ref.watch(userLocationRepositoryProvider);
    state = await AsyncValue.guard(
        () => userLocationRepository.getLocationFromMap());
  }
}
