import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location_repository.g.dart';

abstract class UserLocationRepository {
  Future<LatLng?> fetchUserLocation();

  Stream<LatLng?> watchUserLocation();

  Future<void> setUserLocation(LatLng latLng);
}

@Riverpod(keepAlive: true)
UserLocationRepository userLocationRepository(Ref ref) {
  throw UnimplementedError();
}
