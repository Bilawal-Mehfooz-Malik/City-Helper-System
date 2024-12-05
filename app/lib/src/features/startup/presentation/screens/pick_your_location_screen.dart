import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/utils/osm_helper.dart';
import '../../../../core/utils/theme_extension.dart';
import '../../../../localization/localization_extension.dart';
import '../location_controller.dart';

class PickYourLocationScreen extends ConsumerStatefulWidget {
  const PickYourLocationScreen({super.key});

  @override
  ConsumerState<PickYourLocationScreen> createState() =>
      _PickYourLocationScreenState();
}

class _PickYourLocationScreenState
    extends ConsumerState<PickYourLocationScreen> {
  bool _isMapReady = false;
  late MapController _mapController;
  LatLng _pickedLocation = const LatLng(33.153566, 73.748795);

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  void _initializeMap() {
    _mapController = MapController();
    setState(() => _isMapReady = true);
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final urlTemplate = ref.read(osmTileUrlProvider);
    final userAgentPackageName = ref.read(userAgentPackageNameProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.loc.pickYourLocaiton)),
      body: SafeArea(
        child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialZoom: 12,
            initialCenter: _pickedLocation,
            onMapEvent: (event) {
              if (event is MapEventMove && _isMapReady) {
                setState(() => _pickedLocation = event.camera.center);
              }
            },
          ),
          children: [
            TileLayer(
              urlTemplate: urlTemplate,
              userAgentPackageName: userAgentPackageName,
            ),
            Center(
              child: Icon(
                size: 35,
                Icons.location_pin,
                color: context.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          ref
              .read(locationControllerProvider.notifier)
              .getLocationFromMap(_pickedLocation);
          context.pop();
        },
      ),
    );
  }
}
