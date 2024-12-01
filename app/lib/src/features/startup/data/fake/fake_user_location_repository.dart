import 'package:latlong2/latlong.dart';

import '../../../../core/utils/delay.dart';
import '../../../../core/utils/in_memory_store.dart';
import '../../domain/user_location_repository.dart';

class FakeUserLocationRepository implements UserLocationRepository {
  final bool addDelay;
  FakeUserLocationRepository({this.addDelay = true});

  final _userLocation =
      InMemoryStore<LatLng?>(const LatLng(45.367821, 14.016190));

  @override
  Future<LatLng?> getCurrentLocation() async {
    await delay(addDelay);
    return _userLocation.value;
  }

  @override
  Future<LatLng?> getLocationFromMap() async {
    await delay(addDelay);
    return _userLocation.value;
  }

  void dispose() => _userLocation.close();
}
