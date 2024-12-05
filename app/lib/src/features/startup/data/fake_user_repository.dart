import 'package:latlong2/latlong.dart';

import '../../../core/utils/delay.dart';
import '../../../core/utils/in_memory_store.dart';
import '../domain/user_location_repository.dart';

class FakeUserLocationRepository implements UserLocationRepository {
  final bool addDelay;
  FakeUserLocationRepository({this.addDelay = true});

  final _appUserLocation = InMemoryStore<LatLng?>(null);

  @override
  Future<LatLng?> fetchUserLocation() async {
    await delay(addDelay);
    return _appUserLocation.value;
  }

  @override
  Future<void> setUserLocation(LatLng latLng) async {
    await delay(addDelay);
    _appUserLocation.value = latLng;
  }

  @override
  Stream<LatLng?> watchUserLocation() => _appUserLocation.stream;

  void dispose() => _appUserLocation.close();
}
