import 'package:app/src/core/common_widgets/custom_outlined_button.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/presentation/location_controller.dart';
import 'package:app/src/features/startup/presentation/startup_content/location_preview_widget.dart';
import 'package:app/src/features/startup/presentation/user_location_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

const kGetCurrentKey = Key('get-current-key');
const kFromMapKey = Key('from-map-key');
const kSaveKey = Key('save-location-key');

class StartupBottomSheetContent extends ConsumerWidget {
  const StartupBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userLocationControllerProvider);
    final userLocationState = ref.watch(locationControllerProvider);
    final userController = ref.read(userLocationControllerProvider.notifier);
    final controller = ref.read(locationControllerProvider.notifier);

    final isLoading = userState.isLoading || userLocationState.isLoading;

    // Error handling for userLocation
    ref.listen<AsyncValue>(
      locationControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    // Error handling for userCreation
    ref.listen<AsyncValue>(
      userLocationControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: Sizes.p12,
      children: [
        // [Headline]
        Text(
          context.loc.getLocDescription,
          style: context.textTheme.titleLarge,
        ),

        // [Location Preview Widget]
        const LocationPreviewWidget(),

        /// [GetCurrent] and [FromMap] Buttons
        Row(
          spacing: Sizes.p4,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomOutlinedButton(
                key: kGetCurrentKey,
                isDisabled: isLoading,
                text: context.loc.getCurrent,
                onPressed: controller.getCurrentLocation,
              ),
            ),
            Expanded(
              child: CustomOutlinedButton(
                key: kFromMapKey,
                isDisabled: isLoading,
                text: context.loc.fromMap,
                onPressed: () =>
                    context.goNamed(AppRoute.pickYourLocation.name),
              ),
            ),
          ],
        ),

        /// [SaveLocationButton]
        if (userLocationState.value != null) ...[
          PrimaryButton(
            key: kSaveKey,
            isLoading: userState.isLoading,
            isDisabled: isLoading,
            text: context.loc.saveLocation,
            onPressed: userController.createUser,
          ),
        ],
      ],
    );
  }
}
