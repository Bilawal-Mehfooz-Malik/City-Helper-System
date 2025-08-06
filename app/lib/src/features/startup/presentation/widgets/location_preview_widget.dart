import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:app/src/features/startup/presentation/widgets/google_map_widget.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationPreviewWidget extends ConsumerWidget {
  const LocationPreviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocationValue = ref.watch(userLocationControllerProvider);

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.p16),
          border: Border.all(),
        ),
        child: Center(
          child: AsyncValueWidget(
            value: userLocationValue,
            error: (_, _) => _textWidget(context),
            data: (location) => location == null
                ? _textWidget(context)
                : GoogleMapWidget(latLng: location),
          ),
        ),
      ),
    );
  }

  Text _textWidget(BuildContext context) {
    return Text(
      context.loc.noLocationSelected,
      style: context.textTheme.labelMedium,
    );
  }
}
