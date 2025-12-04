import 'package:app/src/features/pick_location/application/default_lat_lng_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LatLngController extends Notifier<LatLng> {
  final LatLng? intialLocation;

  LatLngController(this.intialLocation);

  @override
  LatLng build() {
    return intialLocation ?? ref.read(defaultLatLngProvider);
  }

  set latLng(LatLng latLng) => state = latLng;
}

final latLngControllerProvider = NotifierProvider.autoDispose
    .family<LatLngController, LatLng, LatLng?>(LatLngController.new);
