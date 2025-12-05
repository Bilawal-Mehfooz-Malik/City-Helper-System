import 'dart:async';
import 'package:app/src/core/common_widgets/loading_dialog.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/screen_utils.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/pick_location/presentation/controllers/map_type_controller.dart';
import 'package:app/src/features/pick_location/presentation/controllers/lat_lng_controller.dart';
import 'package:app/src/features/pick_location/presentation/controllers/pick_location_controller.dart';
import 'package:app/src/features/pick_location/presentation/fab_menu.dart';
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
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: context.colorScheme.onSurface.withAlpha(20),
      builder: (_) =>
          SmallLoadingDialog(message: 'Fetching Location...'.hardcoded),
    );

    try {
      final location = await ref
          .read(pickLocationControllerProvider.notifier)
          .getCurrentLocation();

      if (location != null) {
        await _moveCamera(location, zoomLevel: 18);
      }
    } finally {
      if (mounted) Navigator.pop(context);
    }
  }

  void _onCameraMove(CameraPosition position) {
    ref.read(latLngControllerProvider(widget.initialLocation).notifier).latLng =
        position.target;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.colorScheme;
    final latLng = ref.watch(latLngControllerProvider(widget.initialLocation));
    final mapType = ref.watch(mapTypeControllerProvider);
    final isSmallScreen = isMobileScreen(context);

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
              onCameraMove: _onCameraMove,
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
                      onPressed: _getCurrentLocation,
                      label: Text('Use Current'.hardcoded),
                    ),
                    FloatingActionButton(
                      elevation: 4,
                      backgroundColor: theme.primary,
                      foregroundColor: theme.onPrimary,
                      heroTag: 'saveLocationBtn',
                      onPressed: () {
                        if (widget.onFinish != null) {
                          final latLng = ref.read(
                            latLngControllerProvider(widget.initialLocation),
                          );
                          widget.onFinish!(latLng);
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: const Icon(Icons.check),
                    ),
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

class CenteredIcon extends StatelessWidget {
  const CenteredIcon({super.key, this.iconSize = 40});

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(0, -(iconSize / 2)),
        child: Icon(
          Icons.location_on,
          size: iconSize,
          color: context.colorScheme.error,
        ),
      ),
    );
  }
}
