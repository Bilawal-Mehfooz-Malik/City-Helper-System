import 'dart:async';

import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/presentation/controllers/profile_location_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocationScreen extends ConsumerStatefulWidget {
  final LatLng? initialLocation;
  final VoidCallback? onFinish;
  const PickLocationScreen({super.key, this.initialLocation, this.onFinish});

  @override
  ConsumerState<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends ConsumerState<PickLocationScreen> {
  final double _iconSize = 40;
  late LatLng _pickedLocation;
  MapType _mapType = .normal;
  final _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    final defaultLocation = ref.read(defaultLocationProvider);
    _pickedLocation = widget.initialLocation ?? defaultLocation;
  }

  Future<void> _moveCamera(LatLng target, {double zoomLevel = 13.0}) async {
    if (_controller.isCompleted) {
      final controller = await _controller.future;
      await controller.animateCamera(
        CameraUpdate.newLatLngZoom(target, zoomLevel),
      );
    }
    setState(() => _pickedLocation = target);
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
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primary,
        foregroundColor: theme.onPrimary,
        title: Text(context.loc.pickYourLocation),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: _mapType,
              buildingsEnabled: false,
              zoomControlsEnabled: false,
              webCameraControlEnabled: false,
              onCameraMove: _onCameraMove,
              initialCameraPosition: CameraPosition(
                zoom: 13,
                target: _pickedLocation,
              ),
              onMapCreated: (controller) {
                if (!_controller.isCompleted) _controller.complete(controller);
              },
            ),
            Center(
              child: Transform.translate(
                offset: Offset(0, -(_iconSize / 2)),
                child: Icon(
                  Icons.location_on,
                  size: _iconSize,
                  color: theme.error,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SafeArea(
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .end,
          spacing: Sizes.p12,
          children: [
            _TextFabMenu(
              mapType: _mapType,
              onSelect: (type) => setState(() => _mapType = type),
            ),
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
              onPressed: widget.onFinish ?? () => Navigator.of(context).pop(),
              child: const Icon(Icons.check),
            ),
            gapH8,
          ],
        ),
      ),
    );
  }
}

/// Text-based Material 3 FAB menu for map type selection
class _TextFabMenu extends StatefulWidget {
  final MapType mapType;
  final ValueChanged<MapType> onSelect;

  const _TextFabMenu({required this.mapType, required this.onSelect});

  @override
  State<_TextFabMenu> createState() => _TextFabMenuState();
}

class _TextFabMenuState extends State<_TextFabMenu>
    with SingleTickerProviderStateMixin {
  bool _open = false;
  late AnimationController _controller;
  late Animation<double> _expandAnim;

  final items = <MapType, String>{
    MapType.normal: 'Normal',
    MapType.satellite: 'Satellite',
    MapType.terrain: 'Terrain',
    MapType.hybrid: 'Hybrid',
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _expandAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void _select(MapType type) {
    widget.onSelect(type);
    _toggle();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.colorScheme;

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .end,
      spacing: Sizes.p4,
      children: [
        SizeTransition(
          sizeFactor: _expandAnim,
          axisAlignment: -1.0,
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .end,
            children: items.entries.map((entry) {
              final selected = widget.mapType == entry.key;
              return Align(
                alignment: .centerRight,
                child: Padding(
                  padding: .symmetric(vertical: Sizes.p4),
                  child: InkWell(
                    onTap: () => _select(entry.key),
                    child: Container(
                      padding: .symmetric(
                        horizontal: Sizes.p12,
                        vertical: Sizes.p12,
                      ),
                      decoration: BoxDecoration(
                        color: selected ? theme.primary : theme.surface,
                        borderRadius: .circular(Sizes.p12),
                        boxShadow: kElevationToShadow[2],
                      ),
                      child: Text(
                        entry.value,
                        style: TextStyle(
                          color: selected ? theme.onPrimary : theme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        FloatingActionButton(
          elevation: 2,
          heroTag: 'mainMapFab',
          onPressed: _toggle,
          child: Icon(_open ? Icons.close : Icons.map),
        ),
      ],
    );
  }
}
