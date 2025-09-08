import 'package:app/src/core/common_widgets/custom_outlined_button.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/async_value_ui.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:app/src/features/startup/presentation/pick_location_screen.dart';
import 'package:app/src/features/startup/presentation/widgets/location_preview_widget.dart';
import 'package:app/src/features/startup/presentation/controllers/local_user_location_saver.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const kGetCurrentKey = Key('get-current-key');
const kFromMapKey = Key('from-map-key');
const kSaveKey = Key('save-location-key');

class GetLocationContent extends ConsumerStatefulWidget {
  final bool isLargeScreen;
  const GetLocationContent({super.key, this.isLargeScreen = false});

  @override
  ConsumerState<GetLocationContent> createState() => _GetLocationContentState();
}

class _GetLocationContentState extends ConsumerState<GetLocationContent> {
  bool _isAgreed = false; // State for the agreement checkbox

  @override
  Widget build(BuildContext context) {
    // Remove WidgetRef ref here
    final locationValue = ref.watch(userLocationControllerProvider);
    final locationNotifier = ref.read(userLocationControllerProvider.notifier);
    final userLocationValue = ref.watch(localUserLocationSaverProvider);
    final userLocationNotifier = ref.read(
      localUserLocationSaverProvider.notifier,
    );

    final isLoading =
        userLocationValue.isLoading ||
        locationValue.isLoading || // Use locationValue.isLoading
        userLocationValue.hasError;

    // Error handling for userLocation
    ref.listen<AsyncValue<LatLng?>>(
      userLocationControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    // Error handling for userCreation
    ref.listen<AsyncValue<void>>(
      localUserLocationSaverProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: Sizes.p12,
      children: [
        if (widget.isLargeScreen) gapH16,
        // [Location Preview Widget]
        const LocationPreviewWidget(),

        // [Headline]
        Text(
          context.loc.getLocDescription,
          style: context.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        /// [GetCurrent] and [FromMap] Buttons
        Row(
          spacing: Sizes.p8,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomOutlinedButton(
                key: kGetCurrentKey,
                isDisabled: isLoading || !_isAgreed,
                text: context.loc.getCurrent,
                onPressed: locationNotifier.getCurrentLocation,
              ),
            ),
            Expanded(
              child: CustomOutlinedButton(
                key: kFromMapKey,
                isDisabled: isLoading || !_isAgreed,
                text: context.loc.fromMap,
                onPressed: () async {
                  final pickedLocation = await showGeneralDialog<LatLng>(
                    context: context,
                    pageBuilder: (_, _, _) => PickLocationScreen(
                      initialLocation: locationValue.value,
                    ),
                  );
                  if (pickedLocation != null) {
                    locationNotifier.getLocationFromMap(pickedLocation);
                  }
                },
              ),
            ),
          ],
        ),

        // Agreement Checkbox and Text
        Row(
          children: [
            Checkbox(
              value: _isAgreed,
              onChanged: (value) {
                setState(() {
                  _isAgreed = value ?? false;
                });
              },
            ),
            Flexible(
              child: RichText(
                text: TextSpan(
                  text: context.loc.agreementPrefix,
                  style: context.textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: context.loc.termsOfService,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            context.pushNamed(AppRoute.termsOfService.name),
                    ),
                    TextSpan(
                      text: context.loc.agreementAnd,
                      style: context.textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: context.loc.privacyPolicy,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            context.pushNamed(AppRoute.privacyPolicy.name),
                    ),
                    TextSpan(
                      text: context.loc.agreementSuffix,
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        /// [SaveLocationButton]
        if (locationValue.value != null) ...[
          PrimaryButton(
            key: kSaveKey,
            useMaxSize: true,
            isDisabled: isLoading || !_isAgreed,
            isLoading: userLocationValue.isLoading,
            text: context.loc.saveLocation,
            onPressed: userLocationNotifier.createUser,
          ),
        ],
        if (widget.isLargeScreen) gapH8,
      ],
    );
  }
}
