import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/core/utils/in_memory_store.dart';

class FakeUserLocationRepository implements UserLocationRepository {
  static const userLocationKey = 'userLocation';
  final _fakeDb = InMemoryStore<Map<String, Object?>>({});

  @override
  Future<GeoLocation?> fetchUserLocation() async {
    final geoLocation = _fakeDb.value[userLocationKey];
    return geoLocation != null ? geoLocation as GeoLocation : null;
  }

  @override
  Future<void> setUserLocation(GeoLocation location) async {
    _fakeDb.value[userLocationKey] = location;
  }

  @override
  Stream<GeoLocation?> watchUserLocation() {
    return _fakeDb.stream.map((data) => data[userLocationKey] as GeoLocation?);
  }

  void dispose() => _fakeDb.close();
}
