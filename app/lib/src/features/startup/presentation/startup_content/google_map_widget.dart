import 'dart:async';

import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends ConsumerStatefulWidget {
  final GeoLocation location;
  const GoogleMapWidget({super.key, required this.location});

  @override
  ConsumerState<GoogleMapWidget> createState() => _OpenStreetMapWidgetState();
}

class _OpenStreetMapWidgetState extends ConsumerState<GoogleMapWidget> {
  late double _lat;
  late double _lng;
  late CameraPosition _cameraPosition;
  final _controller = Completer<GoogleMapController>();

  /// Adjust [MapType] and [ZoomLevel] for [GoogleMap]
  final _mapType = MapType.normal;
  final _zoom = 15.0;

  @override
  void initState() {
    super.initState();
    _lat = widget.location.latitude;
    _lng = widget.location.longitude;
    _cameraPosition = CameraPosition(zoom: _zoom, target: LatLng(_lat, _lng));
  }

  Future<void> _moveCameraToNewLocation() async {
    final controller = await _controller.future;
    controller.moveCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }

  @override
  void didUpdateWidget(covariant GoogleMapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // * When the location changes, update the map.
    // * For example, if the user picks a location using [GetCurrent]
    // * and then clicks [FromMap] to select a new location,
    // * the [widget.location] value will change.
    // * Therefore, we need to update the [GoogleMapWidget] to show the new location.
    if (oldWidget.location.latitude != widget.location.latitude ||
        oldWidget.location.longitude != widget.location.longitude) {
      _lat = widget.location.latitude;
      _lng = widget.location.longitude;
      _cameraPosition = CameraPosition(zoom: _zoom, target: LatLng(_lat, _lng));
      _moveCameraToNewLocation();
    }
  }

  @override
  void dispose() {
    _controller.future.then((controller) => controller.dispose());
    super.dispose();
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
            markerId: const MarkerId('userLocation'),
            position: LatLng(_lat, _lng),
            icon: BitmapDescriptor.defaultMarker,
          ),
        },
      ),
    );
  }
}
