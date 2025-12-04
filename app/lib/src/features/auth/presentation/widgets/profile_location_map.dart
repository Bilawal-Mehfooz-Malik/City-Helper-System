import 'package:app/src/features/startup/presentation/controllers/google_map_builder.dart';
import 'package:app/src/features/pick_location/presentation/pick_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:app/src/features/pick_location/application/default_lat_lng_provider.dart';
import 'package:app/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:app/src/features/auth/presentation/controllers/profile_location_controller.dart';

class ProfileLocationMap extends ConsumerWidget {
  const ProfileLocationMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final userLocation = ref.watch(profileLocationControllerProvider).value;
    final defaultLocation = ref.watch(defaultLatLngProvider);
    final mapBuilder = ref.watch(googleMapBuilderProvider);

    return InkWell(
      onTap: authState.isLoading
          ? null
          : () async {
              final result = await showGeneralDialog<LatLng>(
                context: context,
                pageBuilder: (_, _, _) =>
                    PickLocationScreen(initialLocation: userLocation),
              );
              if (result == null) return;

              ref
                  .read(profileLocationControllerProvider.notifier)
                  .updateLocation(result);
            },
      child: AbsorbPointer(
        absorbing: !authState.isLoading,
        child: SizedBox(
          height: 200,
          child: mapBuilder(userLocation ?? defaultLocation),
        ),
      ),
    );
  }
}
