import '../../../../core/utils/delay.dart';
import '../../../../core/utils/in_memory_store.dart';
import '../../domain/geo_location.dart';
import '../../domain/user_location_repository.dart';

class FakeUserLocationRepository implements UserLocationRepository {
  final bool addDelay;
  FakeUserLocationRepository({this.addDelay = true});

  final _userLocation =
      InMemoryStore<GeoLocation?>(GeoLocation(latitude: 123, longitude: 123));

  @override
  Future<GeoLocation?> getCurrentLocation() async {
    await delay(addDelay);
    return _userLocation.value;
  }

  @override
  Future<GeoLocation?> getLocationFromMap() async {
    await delay(addDelay);
    return _userLocation.value;
  }
}
