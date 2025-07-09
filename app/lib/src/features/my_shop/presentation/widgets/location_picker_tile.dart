import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/presentation/controllers/google_map_builder.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
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
    final shopLocation = ref.watch(userLocationControllerProvider).value;
    final location = pickedLatLng ?? shopLocation ?? defaultLocation;

    ref.listen(userLocationControllerProvider, (previous, next) {
      if (previous!.value != next.value) {
        onLocationPicked(next.value);
      }
    });

    return Column(
      spacing: Sizes.p4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pick shop location by clicking on map'.hardcoded,
          style: context.textTheme.titleMedium,
        ),
        GestureDetector(
          onTap: () => context.pushNamed(AppRoute.pickYourLocation.name),
          child: AbsorbPointer(
            absorbing: true,
            child: SizedBox(height: 250, child: mapBuilder(location)),
          ),
        ),
      ],
    );
  }
}
