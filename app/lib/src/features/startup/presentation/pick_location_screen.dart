import 'dart:async';

import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/presentation/controllers/profile_location_controller.dart';

import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocationScreen extends ConsumerStatefulWidget {
  final LatLng? initialLocation;
  const PickLocationScreen({super.key, this.initialLocation});

  @override
  ConsumerState<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends ConsumerState<PickLocationScreen> {
  late LatLng _pickedLocation;
  final _controller = Completer<GoogleMapController>();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pickedLocation = widget.initialLocation ?? ref.read(defaultLocationProvider);
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
        .read(profileLocationControllerProvider.notifier)
        .getCurrentLocation();
    if (location != null) {
      await _moveCamera(location, zoomLevel: 18);
    }
  }

  void _onCameraMove(CameraPosition position) {
    _pickedLocation = position.target;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref
          .read(profileLocationControllerProvider.notifier)
          .updateLocation(_pickedLocation);
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationAsync = ref.watch(profileLocationControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.pickYourLocation),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
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
              onPressed: locationAsync.isLoading ? null : _getCurrentLocation,
              child: locationAsync.isLoading
                  ? const SizedBox(
                      height: 25,
                      width: 25,
                      child: CenteredProgressIndicator(),
                    )
                  : const Icon(Icons.my_location),
            ),
            FloatingActionButton.large(
              heroTag: 'saveLocationBtn',
              onPressed: locationAsync.isLoading
                  ? null
                  : () => Navigator.of(context).pop(_pickedLocation),

              child: const Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
