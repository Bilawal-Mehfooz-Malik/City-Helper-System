import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/presentation/controllers/google_map_builder.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPickerTile extends ConsumerWidget {
  final LatLng? pickedLatLng;
  final ValueChanged<LatLng?> onLocationPicked;

  const LocationPickerTile({
    super.key,
    required this.pickedLatLng,
    required this.onLocationPicked,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapBuilder = ref.watch(googleMapBuilderProvider);
    final defaultLocation = ref.watch(defaultLocationProvider);
    final location = pickedLatLng ?? defaultLocation;

    return Column(
      spacing: Sizes.p4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pick Your Shop Location *'.hardcoded,
          style: context.textTheme.titleMedium,
        ),
        Text(
          "Tap below to open the map. Stand at your business door, press the location icon above the check button to find your spot, then press the check button to save it."
              .hardcoded,
          style: context.textTheme.labelLarge,
        ),
        GestureDetector(
          onTap: () async {
            final result = await context.pushNamed<LatLng>(
              AppRoute.pickYourLocation.name,
            );
            if (result != null) {
              onLocationPicked(result);
            }
          },
          child: AbsorbPointer(
            absorbing: true,
            child: SizedBox(height: 250, child: mapBuilder(location)),
          ),
        ),
      ],
    );
  }
}
