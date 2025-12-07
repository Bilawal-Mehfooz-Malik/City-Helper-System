import 'dart:async';

import 'package:app/src/features/pick_location/data/geolocator_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class PickLocationController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() => null;

  Future<LatLng?> getCurrentLocation() async {
    state = AsyncLoading();
    final repo = ref.read(geoLocatorRepositoryProvider);
    try {
      final loc = await repo.getCurrentLocation();
      state = AsyncData(null);
      return loc;
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}

final pickLocationControllerProvider =
    AsyncNotifierProvider<PickLocationController, void>(
      PickLocationController.new,
    );
