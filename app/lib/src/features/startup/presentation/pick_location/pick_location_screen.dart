import 'dart:async';

import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/utils/default_location_provider.dart';
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
  static const zoomLevel = 13.0;
  late GeoLocation _pickedLocation;
  late CameraPosition _cameraPosition;
  final _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    final previousLocation = ref.read(locationControllerProvider).value;
    final defaultLoc = ref.read(defaultLocationProvider);
    _lat = previousLocation?.latitude ?? defaultLoc.latitude;
    _lng = previousLocation?.longitude ?? defaultLoc.longitude;
    _pickedLocation = GeoLocation(latitude: _lat, longitude: _lng);
    _cameraPosition =
        CameraPosition(zoom: zoomLevel, target: LatLng(_lat, _lng));
  }

  Future<void> _tapSuggestion(GeoLocation data) async {
    _lat = data.latitude;
    _lng = data.longitude;

    await Future<void>.delayed(Duration.zero);

    try {
      if (_controller.isCompleted) {
        final controller = await _controller.future;
        await controller.moveCamera(
          CameraUpdate.newLatLngZoom(LatLng(_lat, _lng), zoomLevel),
        );
      }
    } catch (e, s) {
      AppLogger.logError(
        'Error in moving Camera when Suggestion Tapped',
        error: e,
        stackTrace: s,
      );
    }
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
  Widget build(BuildContext context) {
    final isFocused = ref.watch(searchFocusNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              buildingsEnabled: false,
              onCameraMove: _pickLocationOnMove,
              initialCameraPosition: _cameraPosition,
              scrollGesturesEnabled: !isFocused,
              zoomGesturesEnabled: !isFocused,
              rotateGesturesEnabled: !isFocused,
              tiltGesturesEnabled: !isFocused,
              onMapCreated: (controller) {
                if (!_controller.isCompleted) {
                  _controller.complete(controller);
                }
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(Sizes.p8),
                child: PickLocationSearchBar(
                  onTapSuggestion: _tapSuggestion,
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
