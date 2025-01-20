import 'dart:convert';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/startup/data/user_location_repository.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';

class FakeUserLocationRepository implements UserLocationRepository {
  static const userLocationKey = 'userLocation';
  final _fakeDb = InMemoryStore<Map<String, String?>>({});

  @override
  Future<GeoLocation?> fetchUserLocation() async {
    final json = _fakeDb.value[userLocationKey];
    if (json != null) {
      final map = jsonDecode(json) as Map<String, dynamic>;
      return GeoLocation.fromJson(map);
    }
    return null;
  }

  @override
  Future<void> setUserLocation(GeoLocation location) async {
    final json = jsonEncode(location.toJson());
    _fakeDb.value = {
      ..._fakeDb.value,
      userLocationKey: json,
    };
  }

  @override
  Stream<GeoLocation?> watchUserLocation() {
    return _fakeDb.stream.map((data) {
      final json = data[userLocationKey];
      if (json != null) {
        final map = jsonDecode(json) as Map<String, dynamic>;
        return GeoLocation.fromJson(map);
      }
      return null;
    });
  }

  void dispose() => _fakeDb.close();
}
