import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common_widgets/custom_progress_indicator.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../localization/localization_extension.dart';
import '../user_location_controller.dart';
import 'open_street_map_widget.dart';

class LocationPreviewWidget extends ConsumerWidget {
  const LocationPreviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocationValue = ref.watch(userLocationControllerProvider);

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.p8),
          border: Border.all(),
        ),
        child: Center(
          child: userLocationValue.maybeWhen(
            skipError: true,
            loading: () => const Center(child: CustomProgressIndicator()),
            data: (latLng) => latLng == null
                ? Text(context.loc.notChoosen)
                : OpenStreetMapWidget(latLng: latLng),
            orElse: () => Text(context.loc.notChoosen),
          ),
        ),
      ),
    );
  }
}
