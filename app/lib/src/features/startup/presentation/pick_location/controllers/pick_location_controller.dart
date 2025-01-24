import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pick_location_controller.g.dart';

@riverpod
class PickLocationController extends _$PickLocationController {
  GoogleMapController? _controller;

  @override
  GoogleMapController? build() => _controller;

  void setController(GoogleMapController controller) {
    _controller = controller;
    state = controller; // Update state
  }

  void moveCamera(CameraPosition position) {
    _controller?.animateCamera(CameraUpdate.newCameraPosition(position));
  }
}
