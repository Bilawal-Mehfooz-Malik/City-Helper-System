import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/osm_helper.dart';
import '../../../../core/utils/theme_extension.dart';

class OpenStreetMapWidget extends ConsumerWidget {
  final LatLng latLng;
  const OpenStreetMapWidget({super.key, required this.latLng});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlTemplate = ref.read(osmTileUrlProvider);
    final userAgentPackageName = ref.read(userAgentPackageNameProvider);

    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.p8),
      child: FlutterMap(
        options: MapOptions(
          initialZoom: 15,
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
