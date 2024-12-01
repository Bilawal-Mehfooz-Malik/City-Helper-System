import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/theme_extension.dart';

class OpenStreetMapWidget extends StatelessWidget {
  final LatLng latLng;
  const OpenStreetMapWidget({super.key, required this.latLng});

  @override
  Widget build(BuildContext context) {
    final urlTemplate = dotenv.env['OSM_TILE_URL'] ??
        'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
    final userAgentPackageName =
        dotenv.env['USER_AGENT_PACKAGE_NAME'] ?? 'com.example.app';

    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.p8),
      child: FlutterMap(
        options: MapOptions(
          initialZoom: 18,
          initialCenter: LatLng(latLng.latitude, latLng.longitude),
        ),
        children: [
          TileLayer(
            urlTemplate: urlTemplate,
            userAgentPackageName: userAgentPackageName,
          ),

          // [MarkerIcon]
          MarkerLayer(
            markers: [
              Marker(
                point: latLng,
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
