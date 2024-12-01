import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location_repository.g.dart';

abstract class UserLocationRepository {
  Future<LatLng?> getCurrentLocation();

  Future<LatLng?> getLocationFromMap();
}

@riverpod
UserLocationRepository userLocationRepository(Ref ref) {
  throw UnimplementedError();
}
