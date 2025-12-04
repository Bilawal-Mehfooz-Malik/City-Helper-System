import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/pick_location/application/default_lat_lng_provider.dart';
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
    final defaultLocation = ref.watch(defaultLatLngProvider);
    final location = pickedLatLng ?? defaultLocation;

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.p8),
        side: BorderSide(
          color: context.colorScheme.outline.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.colorScheme.surface,
              context.colorScheme.surface.withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pick Your Shop Location *'.hardcoded,
                style: context.textTheme.titleMedium,
              ),
              gapH4,
              Text(
                "Tap the map or button below to select your shop's location. Stand at your business door, press the location icon to find your spot, then save it."
                    .hardcoded,
                style: context.textTheme.labelLarge,
              ),
              gapH8,
              GestureDetector(
                onTap: () async {
                  final result = await context.pushNamed<LatLng>(
                    AppRoute.pickYourLocation.name,
                  );
                  if (result != null) onLocationPicked(result);
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.p8),
                    border: Border.all(
                      color: context.colorScheme.outline.withValues(alpha: 0.5),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: context.colorScheme.shadow.withValues(
                          alpha: 0.1,
                        ),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.p8),
                    child: AbsorbPointer(
                      absorbing: true,
                      child: mapBuilder(location),
                    ),
                  ),
                ),
              ),
              gapH8,
              Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final result = await context.pushNamed<LatLng>(
                      AppRoute.pickYourLocation.name,
                    );
                    if (result != null) onLocationPicked(result);
                  },
                  icon: Icon(
                    Icons.location_pin,
                    color: context.colorScheme.onPrimary,
                  ),
                  label: Text(
                    'Select Location'.hardcoded,
                    style: TextStyle(color: context.colorScheme.onPrimary),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.p8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.p16,
                      vertical: Sizes.p12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
