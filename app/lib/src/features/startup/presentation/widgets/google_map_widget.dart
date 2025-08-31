import 'dart:async';

import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/startup/presentation/controllers/google_map_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends ConsumerWidget {
  final LatLng latLng;
  const GoogleMapWidget({super.key, required this.latLng});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final builder = ref.watch(googleMapBuilderProvider);
    return builder(latLng);
  }
}

class RealGoogleMapWidget extends ConsumerStatefulWidget {
  final LatLng latLng;
  const RealGoogleMapWidget({super.key, required this.latLng});

  @override
  ConsumerState<RealGoogleMapWidget> createState() =>
      _RealGoogleMapWidgetState();
}

class _RealGoogleMapWidgetState extends ConsumerState<RealGoogleMapWidget> {
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
  void didUpdateWidget(covariant RealGoogleMapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.latLng != widget.latLng) {
      _cameraPosition = CameraPosition(zoom: _zoom, target: widget.latLng);
      if (_controller.isCompleted) {
        _moveCameraToNewLocation();
      }
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
