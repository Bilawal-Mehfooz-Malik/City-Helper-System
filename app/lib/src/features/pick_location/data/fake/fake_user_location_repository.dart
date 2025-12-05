import 'package:app/src/features/pick_location/data/real/user_location_repository.dart';
import 'package:app/src/features/pick_location/domain/user_location.dart';
import 'package:app/src/core/utils/in_memory_store.dart';

class FakeUserLocationRepository implements UserLocationRepository {
  static const String userLocationKey = UserLocationRepository.userLocationKey;

  /// Simple in-memory map
  final InMemoryStore<Map<String, Object?>> _fakeDb =
      InMemoryStore<Map<String, Object?>>({});

  @override
  Future<UserLocation?> fetchUserLocation() async {
    final jsonMap = _fakeDb.value[userLocationKey];
    if (jsonMap != null) {
      return UserLocation.fromJson(Map<String, Object?>.from(jsonMap as Map));
    }
    return null;
  }

  @override
  Future<void> saveUserLocation(UserLocation location) async {
    _fakeDb.value = {..._fakeDb.value, userLocationKey: location.toJson()};
  }

  @override
  Future<void> clearUserLocation() async {
    final newValue = Map<String, Object?>.from(_fakeDb.value);
    newValue.remove(userLocationKey);
    _fakeDb.value = newValue;
  }
}
