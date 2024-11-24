import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common_widgets/custom_outlined_button.dart';
import '../../../../core/common_widgets/primary_button.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/async_value_ui.dart';
import '../../../../core/utils/theme_extension.dart';
import '../../../../localization/localization_extension.dart';
import '../../data/fake_location_repository.dart';
import '../location_controller.dart';
import 'location_preview_widget.dart';

class StartupBottomSheetContent extends ConsumerWidget {
  const StartupBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(locationControllerProvider);
    final controller = ref.read(locationControllerProvider.notifier);
    final locationState = ref.watch(userLocationStateChangesProvider);

    ref.listen<AsyncValue>(
      locationControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // [Headline]
        Text(
          context.loc.getLocDescription,
          style: context.textTheme.titleMedium,
        ),
        gapH12,

        LocationPreviewWidget(isLoading: state.isLoading),
        gapH12,

        // [Get Current] and [From Map] Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomOutlinedButton(
                isDisabled: state.isLoading,
                text: context.loc.getCurrent,
                onPressed: controller.getCurrentLocation,
              ),
            ),
            gapW4,
            Expanded(
              child: CustomOutlinedButton(
                isDisabled: state.isLoading,
                text: context.loc.fromMap,
                onPressed: controller.getLocationFromMap,
              ),
            ),
          ],
        ),
        gapH12,

        // [Save Location Button]

        if (locationState.value != null) ...[
          PrimaryButton(
            isDisabled: state.isLoading,
            text: context.loc.saveLocation,
            onPressed: () {},
          ),
          gapH12,
        ],
      ],
    );
  }
}
