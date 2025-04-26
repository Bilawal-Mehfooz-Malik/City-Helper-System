import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/startup/presentation/startup_content/google_map_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_map_controller.g.dart';

@riverpod
GoogleMapBuilder googleMapController(Ref ref) {
  return (latLng) => RealGoogleMapWidget(latLng: latLng);
}
