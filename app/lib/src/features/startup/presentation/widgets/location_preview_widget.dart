import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common_widgets/custom_progress_indicator.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../localization/localization_extension.dart';
import '../user_location_controller.dart';

class LocationPreviewWidget extends ConsumerWidget {
  const LocationPreviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocationValue = ref.watch(userLocationControllerProvider);

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(Sizes.p8),
        ),
        child: Center(
          child: userLocationValue.maybeWhen(
            skipError: true,
            loading: () => const Center(child: CustomProgressIndicator()),
            data: (location) => location == null
                ? Text(context.loc.notChoosen)
                : Text('Lat: ${location.latitude}, Lon: ${location.longitude}'),
            orElse: () => Text(context.loc.notChoosen),
          ),
        ),
      ),
    );
  }
}
