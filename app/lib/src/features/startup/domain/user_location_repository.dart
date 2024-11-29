import 'package:app/src/features/startup/domain/geo_location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location_repository.g.dart';

abstract class UserLocationRepository {
  Future<GeoLocation?> getCurrentLocation();

  Future<GeoLocation?> getLocationFromMap();
}

@riverpod
UserLocationRepository userLocationRepository(Ref ref) {
  throw UnimplementedError();
}
