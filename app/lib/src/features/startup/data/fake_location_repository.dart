import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/location.dart';
import '../../../core/utils/delay.dart';
import '../../../core/utils/in_memory_store.dart';

part 'fake_location_repository.g.dart';

class FakeLocationRepository {
  final bool addDelay;
  FakeLocationRepository({this.addDelay = true});

  final _userLocation = InMemoryStore<GeoLocation?>(null);
  final _testLocation = GeoLocation(latitude: 123, longitude: 123);

  // [Getters]
  GeoLocation? get userLocation => _userLocation.value;
  Stream<GeoLocation?> userLocationState() => _userLocation.stream;

  Future<void> getCurrentLocation() async {
    await delay(addDelay);
    _userLocation.value = _testLocation;
  }

  Future<void> getLocationFromMap() async {
    await delay(addDelay);
    _userLocation.value = _testLocation;
  }
}

@Riverpod(keepAlive: true)
FakeLocationRepository fakeLocationRepository(Ref ref) {
  return FakeLocationRepository();
}

// * Using keepAlive since other providers need it to be an
// * [AlwaysAliveProviderListenable]
@Riverpod(keepAlive: true)
Stream<GeoLocation?> userLocationStateChanges(Ref ref) {
  final locationRepository = ref.watch(fakeLocationRepositoryProvider);
  return locationRepository.userLocationState();
}
