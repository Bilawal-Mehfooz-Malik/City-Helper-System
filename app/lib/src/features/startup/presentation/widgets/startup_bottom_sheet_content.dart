import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common_widgets/custom_outlined_button.dart';
import '../../../../core/common_widgets/primary_button.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/async_value_ui.dart';
import '../../../../core/utils/theme_extension.dart';
import '../../../../localization/localization_extension.dart';
import '../user_controller.dart';
import '../user_location_controller.dart';
import 'location_preview_widget.dart';

const kGetCurrentKey = Key('get-current-key');
const kFromMapKey = Key('from-map-key');
const kSaveKey = Key('save-location-key');

class StartupBottomSheetContent extends ConsumerWidget {
  const StartupBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch the state and controllers for user and location
    final userState = ref.watch(userControllerProvider);
    final userLocationState = ref.watch(userLocationControllerProvider);
    final userController = ref.read(userControllerProvider.notifier);
    final controller = ref.read(userLocationControllerProvider.notifier);

    final isLoading = userState.isLoading || userLocationState.isLoading;

    // Error handling for userLocation
    ref.listen<AsyncValue>(
      userLocationControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    // Error handling for userCreation
    ref.listen<AsyncValue>(
      userControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // [Headline]
        Text(
          context.loc.getLocDescription,
          style: context.textTheme.titleLarge,
        ),
        gapH12,

        // [Location Preview Widget]
        const LocationPreviewWidget(),
        gapH12,

        // [Get Current] and [From Map] Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomOutlinedButton(
                key: kGetCurrentKey,
                isDisabled: isLoading, // Disable button if any state is loading
                text: context.loc.getCurrent,
                onPressed: controller.getCurrentLocation,
              ),
            ),
            gapW4,
            Expanded(
              child: CustomOutlinedButton(
                key: kFromMapKey,
                isDisabled: isLoading, // Disable button if any state is loading
                text: context.loc.fromMap,
                onPressed: controller.getLocationFromMap,
              ),
            ),
          ],
        ),
        gapH12,

        // [Save Location Button]
        if (userLocationState.value != null) ...[
          PrimaryButton(
            key: kSaveKey,
            isLoading: userState.isLoading, // Show loading if saving user
            isDisabled: isLoading, // Disable if any state is loading
            text: context.loc.saveLocation,
            onPressed: userController.createUser,
          ),
          gapH12,
        ],
      ],
    );
  }
}
