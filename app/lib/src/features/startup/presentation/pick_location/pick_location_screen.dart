import 'dart:async';

import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/domain/user_location.dart';
import 'package:app/src/features/startup/presentation/location_controller.dart';
import 'package:app/src/features/startup/presentation/pick_location/pick_location_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocationScreen extends ConsumerStatefulWidget {
  const PickLocationScreen({super.key});

  @override
  ConsumerState<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends ConsumerState<PickLocationScreen> {
  late UserLocation _pickedLocation;
  late CameraPosition _cameraPosition;
  final _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    final previousLocation = ref.read(locationControllerProvider).value;
    final lat = previousLocation?.latitude ?? 33.150691628036256;
    final lng = previousLocation?.longitude ?? 73.74845167724608;
    _pickedLocation = UserLocation(latitude: lat, longitude: lng);
    _cameraPosition = CameraPosition(zoom: 13.0, target: LatLng(lat, lng));
  }

  void _saveLocation(BuildContext context) {
    ref
        .read(locationControllerProvider.notifier)
        .getLocationFromMap(_pickedLocation);
    context.pop();
  }

  void _pickLocationOnMove(CameraPosition position) {
    setState(() {
      _pickedLocation = UserLocation(
          latitude: position.target.latitude,
          longitude: position.target.longitude);
    });
  }

  @override
  void dispose() {
    _controller.future.then((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              onCameraMove: _pickLocationOnMove,
              initialCameraPosition: _cameraPosition,
              onMapCreated: (controller) => _controller.complete(controller),
            ),
            const Padding(
              padding: EdgeInsets.all(Sizes.p8),
              child: PickLocationSearchBar(),
            ),
            Center(
              child: Icon(
                size: 35,
                Icons.location_on,
                color: context.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: Sizes.p12, right: Sizes.p12),
        child: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () => _saveLocation(context),
        ),
      ),
    );
  }
}
