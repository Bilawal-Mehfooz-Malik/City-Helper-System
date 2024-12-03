import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/osm_helper.dart';
import '../../../../core/utils/theme_extension.dart';

class OpenStreetMapWidget extends ConsumerStatefulWidget {
  final LatLng latLng;
  const OpenStreetMapWidget({super.key, required this.latLng});

  @override
  ConsumerState<OpenStreetMapWidget> createState() =>
      _OpenStreetMapWidgetState();
}

class _OpenStreetMapWidgetState extends ConsumerState<OpenStreetMapWidget> {
  late MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  void didUpdateWidget(OpenStreetMapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the location has changed
    if (oldWidget.latLng != widget.latLng) {
      _mapController.move(widget.latLng, _mapController.camera.zoom);
    }
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

    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.p8),
      child: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialZoom: 15,
          initialCenter: LatLng(
            widget.latLng.latitude,
            widget.latLng.longitude,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: urlTemplate,
            userAgentPackageName: userAgentPackageName,
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: widget.latLng,
                child: Icon(
                  size: 35,
                  Icons.location_pin,
                  color: context.colorScheme.error,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
