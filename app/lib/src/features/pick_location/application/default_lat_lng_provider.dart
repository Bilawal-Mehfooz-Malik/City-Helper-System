import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final defaultLatLngProvider = Provider.autoDispose<LatLng>((ref) {
  return LatLng(33.150691628036256, 73.74845167724608);
});
