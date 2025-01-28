import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'default_location_provider.g.dart';

@riverpod
LatLng defaultLocation(Ref ref) {
  return LatLng(33.150691628036256, 73.74845167724608);
}
