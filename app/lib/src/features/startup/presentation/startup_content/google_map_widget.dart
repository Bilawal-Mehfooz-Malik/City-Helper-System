import 'dart:async';

import 'package:app/src/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends ConsumerStatefulWidget {
  final LatLng latLng;
  const GoogleMapWidget({super.key, required this.latLng});

  @override
  ConsumerState<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends ConsumerState<GoogleMapWidget> {
  final _zoom = 15.0;
  final _mapType = MapType.normal;
  late CameraPosition _cameraPosition;
  final _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    _cameraPosition = CameraPosition(zoom: _zoom, target: widget.latLng);
  }

  Future<void> _moveCameraToNewLocation() async {
    final controller = await _controller.future;
    await controller.moveCamera(
      CameraUpdate.newCameraPosition(_cameraPosition),
    );
  }

  @override
  void didUpdateWidget(covariant GoogleMapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // * When the location changes, update the map.
    // * For example, if the user picks a location using [GetCurrent]
    // * and then clicks [FromMap] to select a new location,
    // * the [widget.location] value will change.
    // * Therefore, we need to update the [GoogleMapWidget] to show the new location.
    if (oldWidget.latLng != widget.latLng) {
      _cameraPosition = CameraPosition(zoom: _zoom, target: widget.latLng);
      _moveCameraToNewLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.p8),
      child: GoogleMap(
        mapType: _mapType,
        initialCameraPosition: _cameraPosition,
        onMapCreated: (controller) => _controller.complete(controller),
        markers: {
          Marker(
            markerId: const MarkerId('user_location'),
            position: widget.latLng,
            icon: BitmapDescriptor.defaultMarker,
          ),
        },
      ),
    );
  }
}
