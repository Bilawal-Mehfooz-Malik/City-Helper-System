import 'dart:async';

import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
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
  late LatLng _pickedLocation;
  final _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    final previousLocation = ref.read(userLocationControllerProvider).value;
    final defaultLoc = ref.read(defaultLocationProvider);
    _pickedLocation = previousLocation ?? defaultLoc;
  }

  Future<void> _moveCamera(LatLng target, {double zoomLevel = 13.0}) async {
    if (_controller.isCompleted) {
      final controller = await _controller.future;
      final update = CameraUpdate.newLatLngZoom(target, zoomLevel);
      await controller.animateCamera(update);
    }
    setState(() {
      _pickedLocation = target;
    });
  }

  Future<void> _getCurrentLocation() async {
    final location = await ref
        .read(userLocationControllerProvider.notifier)
        .getCurrentLocation();
    if (location != null) {
      await _moveCamera(location, zoomLevel: 18);
    }
  }

  void _saveLocation(BuildContext context) {
    ref
        .read(userLocationControllerProvider.notifier)
        .getLocationFromMap(_pickedLocation);
    context.goNamed(AppRoute.getStarted.name);
  }

  void _onCameraMove(CameraPosition position) {
    _pickedLocation = position.target;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(userLocationControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text(context.loc.pickYourLocation)),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              buildingsEnabled: false,
              zoomControlsEnabled: false,
              onCameraMove: _onCameraMove,
              initialCameraPosition: CameraPosition(
                zoom: 13,
                target: _pickedLocation,
              ),
              onMapCreated: (controller) {
                if (!_controller.isCompleted) {
                  _controller.complete(controller);
                }
              },
            ),
            Center(
              child: Icon(
                Icons.location_on,
                size: 40,
                color: context.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: Sizes.p16),
        child: Column(
          spacing: Sizes.p16,
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'currentLocationBtn',
              backgroundColor: context.colorScheme.onPrimary,
              foregroundColor: context.colorScheme.primary,
              shape: const CircleBorder(),
              onPressed: isLoading ? null : _getCurrentLocation,
              child: isLoading
                  ? const SizedBox(
                      height: 25,
                      width: 25,
                      child: CenteredProgressIndicator(),
                    )
                  : const Icon(Icons.my_location),
            ),
            FloatingActionButton.large(
              heroTag: 'saveLocationBtn',
              onPressed: isLoading ? null : () => _saveLocation(context),
              child: const Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
