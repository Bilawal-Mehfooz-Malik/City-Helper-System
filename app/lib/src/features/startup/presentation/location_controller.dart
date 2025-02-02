import 'package:app/src/core/models/place.dart';
import 'package:app/src/features/startup/data/real/location_search_repository.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/real/geolocator_repository.dart';

part 'location_controller.g.dart';

@riverpod
class LocationController extends _$LocationController {
  @override
  FutureOr<GeoLocation?> build() {
    return null;
  }

  Future<GeoLocation?> getCurrentLocation() async {
    state = const AsyncLoading();
    final locationRepo = ref.read(geoLocatorRepositoryProvider);
    state = await AsyncValue.guard(() => locationRepo.getCurrentLocation());
    return state.value;
  }

  void getLocationFromMap(GeoLocation location) async {
    state = const AsyncLoading();
    state = AsyncData(location);
  }

  Future<Place?> fetchPlaceDetails(PlaceSuggestion suggestion) async {
    try {
      state = const AsyncLoading();
      final repo = ref.watch(locationSearchRepositoryProvider);

      final place = await repo.fetchPlaceDetails(suggestion);
      final location = place.geoLocation;

      if (location == null) {
        state = const AsyncData(null);
        return null;
      }

      state = AsyncData(GeoLocation(
        latitude: location.latitude,
        longitude: location.longitude,
      ));

      return place;
    } catch (e, s) {
      state = AsyncError(e, s);
      return null;
    }
  }
}
