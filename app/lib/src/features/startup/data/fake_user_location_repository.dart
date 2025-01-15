import 'dart:convert';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/startup/data/user_location_repository.dart';
import 'package:app/src/features/startup/domain/user_location.dart';
import 'package:sembast/sembast.dart';

class FakeUserLocationRepository implements UserLocationRepository {
  final int mockTimeOut;
  final _db = InMemoryStore<Map<String, String?>>({});

  FakeUserLocationRepository({this.mockTimeOut = 15});

  static const userLocationKey = 'userLocation';

  @override
  int get timeOut => mockTimeOut;

  @override
  Database get db => throw UnimplementedError();

  @override
  StoreRef<Object?, Object?> get store => throw UnimplementedError();

  @override
  Future<UserLocation?> fetchUserLocation() async {
    final json = _db.value[userLocationKey];
    if (json != null) {
      final map = jsonDecode(json) as Map<String, dynamic>;
      return UserLocation.fromJson(map);
    }
    return null;
  }

  @override
  Future<void> setUserLocation(UserLocation location) async {
    final json = jsonEncode(location.toJson());
    _db.value = {
      ..._db.value,
      userLocationKey: json,
    };
  }

  @override
  Stream<UserLocation?> watchUserLocation() {
    return _db.stream.map((data) {
      final json = data[userLocationKey];
      if (json != null) {
        final map = jsonDecode(json) as Map<String, dynamic>;
        return UserLocation.fromJson(map);
      }
      return null;
    });
  }

  void dispose() => _db.close();
}
