import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FakeUserLocationRepository implements UserLocationRepository {
  static String get userLocationKey => 'userLocation';
  final _fakeDb = InMemoryStore<Map<String, Object?>>({});

  @override
  Future<LatLng?> fetchUserLocation() async {
    final latLng = _fakeDb.value[userLocationKey];
    return latLng != null ? latLng as LatLng : null;
  }

  @override
  Future<void> setUserLocation(LatLng location) async {
    _fakeDb.value = {..._fakeDb.value, userLocationKey: location};
  }
}
