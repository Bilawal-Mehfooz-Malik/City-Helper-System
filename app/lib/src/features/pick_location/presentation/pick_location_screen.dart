import 'dart:async';
import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/core/utils/screen_utils.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/pick_location/presentation/centered_map_icon.dart';
import 'package:app/src/features/pick_location/presentation/controllers/map_type_controller.dart';
import 'package:app/src/features/pick_location/presentation/controllers/lat_lng_controller.dart';
import 'package:app/src/features/pick_location/presentation/controllers/pick_location_controller.dart';
import 'package:app/src/features/pick_location/presentation/fab_menu.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocationScreen extends ConsumerStatefulWidget {
  final LatLng? initialLocation;
  final void Function(LatLng)? onFinish;
  const PickLocationScreen({super.key, this.initialLocation, this.onFinish});

  @override
  ConsumerState<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends ConsumerState<PickLocationScreen> {
  final _controller = Completer<GoogleMapController>();

  Future<void> _moveCamera(LatLng target, {double zoomLevel = 13.0}) async {
    if (_controller.isCompleted) {
      final controller = await _controller.future;
      await controller.animateCamera(
        CameraUpdate.newLatLngZoom(target, zoomLevel),
      );
    }
    ref.read(latLngControllerProvider(widget.initialLocation).notifier).latLng =
        target;
  }

  Future<void> _getCurrentLocation() async {
    final location = await ref
        .read(pickLocationControllerProvider.notifier)
        .getCurrentLocation();

    if (location != null) {
      await _moveCamera(location, zoomLevel: 18);
    }
  }

  void _onCameraMove(CameraPosition position) {
    ref.read(latLngControllerProvider(widget.initialLocation).notifier).latLng =
        position.target;
  }

  void _onSave() {
    if (widget.onFinish != null) {
      final latLng = ref.read(latLngControllerProvider(widget.initialLocation));
      widget.onFinish!(latLng);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(pickLocationControllerProvider, (_, state) {
      if (!mounted) return;
      state.showAlertDialogOnError(context);
    });

    ref.listen<AsyncValue<void>>(userLocationControllerProvider, (_, state) {
      if (!mounted) return;
      state.showAlertDialogOnError(context);
    });

    final isSmallScreen = isMobileScreen(context);
    final mapType = ref.watch(mapTypeControllerProvider);

    final savingLocationLoading = ref
        .watch(userLocationControllerProvider)
        .isLoading;
    final gettingLocationLoading = ref
        .watch(pickLocationControllerProvider)
        .isLoading;
    final isLoading = savingLocationLoading || gettingLocationLoading;

    final latLng = ref.watch(latLngControllerProvider(widget.initialLocation));

    return Scaffold(
      appBar: AppBar(title: Text(context.loc.pickYourLocation)),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: mapType,
              buildingsEnabled: false,
              zoomControlsEnabled: false,
              webCameraControlEnabled: false,

              // Disable gestures if loading
              zoomGesturesEnabled: !isLoading,
              scrollGesturesEnabled: !isLoading,
              rotateGesturesEnabled: !isLoading,
              tiltGesturesEnabled: !isLoading,

              // Disable updating latLng while loading
              onCameraMove: isLoading ? null : _onCameraMove,

              initialCameraPosition: CameraPosition(zoom: 13, target: latLng),
              onMapCreated: (controller) {
                if (!_controller.isCompleted) _controller.complete(controller);
              },
            ),
            CenteredIcon(),
            Positioned(
              bottom: isSmallScreen ? Sizes.p16 : Sizes.p32,
              right: isSmallScreen ? Sizes.p16 : Sizes.p32,
              child: IntrinsicWidth(
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .end,
                  spacing: isSmallScreen ? Sizes.p12 : Sizes.p20,
                  children: [
                    FabMenu(mapType: mapType),
                    FloatingActionButton.extended(
                      elevation: 2,
                      heroTag: 'currentLocationBtn',
                      backgroundColor: context.colorScheme.secondary,
                      foregroundColor: context.colorScheme.onSecondary,
                      onPressed: isLoading ? null : _getCurrentLocation,
                      label: gettingLocationLoading
                          ? CustomCircularProgressIndicator(
                              color: context.colorScheme.onSecondary,
                            )
                          : Text('Use Current'.hardcoded),
                    ),
                    FloatingActionButton.large(
                      elevation: 4,
                      backgroundColor: context.colorScheme.primary,
                      foregroundColor: context.colorScheme.onPrimary,
                      heroTag: 'saveLocationBtn',
                      onPressed: isLoading ? null : _onSave,
                      child: savingLocationLoading
                          ? CustomCircularProgressIndicator(
                              color: context.colorScheme.onPrimary,
                            )
                          : const Icon(Icons.check),
                    ),
                    if (isSmallScreen) gapH16,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
