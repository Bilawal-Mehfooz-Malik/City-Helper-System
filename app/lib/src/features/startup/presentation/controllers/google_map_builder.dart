import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/startup/presentation/widgets/google_map_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final googleMapBuilderProvider = Provider<GoogleMapBuilder>((ref) {
  return (latLng) => RealGoogleMapWidget(latLng: latLng);
});
