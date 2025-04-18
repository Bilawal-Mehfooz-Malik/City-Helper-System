import 'package:app/src/core/common_widgets/custom_outlined_button.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/presentation/controllers/location_controller.dart';
import 'package:app/src/features/startup/presentation/startup_content/location_preview_widget.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const kGetCurrentKey = Key('get-current-key');
const kFromMapKey = Key('from-map-key');
const kSaveKey = Key('save-location-key');

class GetLocationContent extends ConsumerWidget {
  final bool isLargeScreen;
  const GetLocationContent({super.key, this.isLargeScreen = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationValue = ref.watch(locationControllerProvider);
    final locationNotifier = ref.read(locationControllerProvider.notifier);
    final userLocationValue = ref.watch(userLocationControllerProvider);
    final userLocationNotifier = ref.read(
      userLocationControllerProvider.notifier,
    );

    final isLoading =
        userLocationValue.isLoading ||
        locationValue.isLoading ||
        userLocationValue.hasError;

    // Error handling for userLocation
    ref.listen<AsyncValue<LatLng?>>(
      locationControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    // Error handling for userCreation
    ref.listen<AsyncValue<void>>(
      userLocationControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: Sizes.p12,
      children: [
        if (isLargeScreen) gapH16,
        // [Headline]
        Text(
          context.loc.getLocDescription,
          style: context.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        // [Location Preview Widget]
        const LocationPreviewWidget(),

        /// [GetCurrent] and [FromMap] Buttons
        Row(
          spacing: Sizes.p8,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomOutlinedButton(
                key: kGetCurrentKey,
                isDisabled: isLoading,
                text: context.loc.getCurrent,
                onPressed: locationNotifier.getCurrentLocation,
              ),
            ),
            Expanded(
              child: CustomOutlinedButton(
                key: kFromMapKey,
                isDisabled: isLoading,
                text: context.loc.fromMap,
                onPressed:
                    () => context.goNamed(AppRoute.pickYourLocation.name),
              ),
            ),
          ],
        ),

        /// [SaveLocationButton]
        if (locationValue.value != null) ...[
          PrimaryButton(
            key: kSaveKey,
            useMaxSize: true,
            isDisabled: isLoading,
            isLoading: userLocationValue.isLoading,
            text: context.loc.saveLocation,
            onPressed: userLocationNotifier.createUser,
          ),
        ],
        if (isLargeScreen) gapH8,
      ],
    );
  }
}
