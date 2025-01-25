import 'dart:async';

import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/features/startup/presentation/location_controller.dart';
import 'package:app/src/features/startup/presentation/pick_location/search_bar/pick_location_search_bar.dart';
import 'package:app/src/features/startup/presentation/pick_location/controllers/search_focus_notifier.dart';
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
  late double _lat;
  late double _lng;
  String address = '';
  String autoCompletePlace = '';
  late GeoLocation _pickedLocation;
  late CameraPosition _cameraPosition;
  final _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    final previousLocation = ref.read(locationControllerProvider).value;
    _lat = previousLocation?.latitude ?? 33.150691628036256;
    _lng = previousLocation?.longitude ?? 73.74845167724608;
    _pickedLocation = GeoLocation(latitude: _lat, longitude: _lng);
    _cameraPosition = CameraPosition(zoom: 13.0, target: LatLng(_lat, _lng));
  }

  /// Used in [SuggestionListTile]
  Future<void> _moveCameraToNewLocation() async {
    final controller = await _controller.future;
    await controller
        .moveCamera(CameraUpdate.newLatLngZoom(LatLng(_lat, _lng), 16));
  }

  void _saveLocation(BuildContext context) {
    ref
        .read(locationControllerProvider.notifier)
        .getLocationFromMap(_pickedLocation);
    context.pop();
  }

  void _pickLocationOnMove(CameraPosition position) {
    setState(() {
      _pickedLocation = GeoLocation(
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
    final isSearchFocused = ref.watch(searchFocusNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              onCameraMove: isSearchFocused ? null : _pickLocationOnMove,
              initialCameraPosition: _cameraPosition,
              onMapCreated: (controller) => _controller.complete(controller),
              scrollGesturesEnabled: !isSearchFocused,
              zoomGesturesEnabled: !isSearchFocused,
              rotateGesturesEnabled: !isSearchFocused,
              tiltGesturesEnabled: !isSearchFocused,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(Sizes.p8),
                child: PickLocationSearchBar(
                  onTapSuggestion: (data) async {
                    setState(() {
                      _lat = data.latitude;
                      _lng = data.longitude;
                      _cameraPosition = CameraPosition(
                        zoom: _cameraPosition.zoom,
                        target: LatLng(_lat, _lng),
                      );
                    });
                    await _moveCameraToNewLocation();
                  },
                ),
              ),
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
