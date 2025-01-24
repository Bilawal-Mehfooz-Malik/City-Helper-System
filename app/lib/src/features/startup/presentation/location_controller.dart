import 'package:app/src/core/models/place.dart';
import 'package:app/src/features/startup/data/location_search_repository.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/geolocator_repository.dart';

part 'location_controller.g.dart';

@riverpod
class LocationController extends _$LocationController {
  @override
  FutureOr<GeoLocation?> build() {
    return null;
  }

  Future<void> getCurrentLocation() async {
    state = const AsyncLoading();
    final locationRepo = ref.read(geoLocatorRepositoryProvider);
    state = await AsyncValue.guard(() => locationRepo.getCurrentLocation());
  }

  void getLocationFromMap(GeoLocation location) async {
    state = const AsyncLoading();
    state = AsyncData(location);
  }

  Future<Place?> fetchPlaceDetails(PlaceSuggestion suggestion) async {
    state = const AsyncLoading();
    try {
      final repo = ref.watch(locationSearchRepositoryProvider);
      final res = await repo.fetchPlaceDetails(suggestion);
      final location = res.geoLocation;
      if (location == null) {
        return null;
      }
      state = AsyncData(GeoLocation(
        latitude: location.latitude,
        longitude: location.longitude,
      ));

      return res;
    } catch (e, s) {
      debugPrint('Error in fetching details: $e and stackTrace: $s');
      return null;
    }
  }
}
