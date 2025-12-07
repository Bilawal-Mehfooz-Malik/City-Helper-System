import 'package:app/src/core/common_widgets/custom_animated_screen.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/pick_location/presentation/pick_location_screen.dart';
import 'package:app/src/features/startup/domain/coordinates.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BottomCTASection extends StatelessWidget {
  const BottomCTASection({super.key});

  Future<void> _saveUserLocation(
    BuildContext context,
    WidgetRef ref,
    LatLng latLng,
  ) async {
    final controller = ref.read(userLocationControllerProvider.notifier);
    await controller.saveUserLocation(
      Coordinates(latitude: latLng.latitude, longitude: latLng.longitude),
    );
  }

  @override
  Widget build(BuildContext context) {
    final richTextStyle = TextStyle(
      color: context.colorScheme.primary,
      fontWeight: .w600,
      decoration: .underline,
      decorationColor: context.colorScheme.primary,
      decorationThickness: 2,
    );

    return Column(
      spacing: Sizes.p16,
      children: [
        Consumer(
          builder: (context, ref, child) {
            return PrimaryButton(
              useMaxSize: true,
              text: context.loc.getStarted,
              onPressed: () => Navigator.of(context).push(
                MaterialCustomAnimatedScreen<void>(
                  child: PickLocationScreen(
                    onFinish: (LatLng latLng) =>
                        _saveUserLocation(context, ref, latLng),
                  ),
                  transitionType: .slide,
                ),
              ),
            );
          },
        ),

        _TermsAndPolicySection(richTextStyle: richTextStyle),
      ],
    );
  }
}

class _TermsAndPolicySection extends StatelessWidget {
  const _TermsAndPolicySection({required this.richTextStyle});

  final TextStyle richTextStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: .center,
      text: TextSpan(
        style: context.textTheme.labelLarge!.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
        children: [
          TextSpan(text: "By proceeding, you agree with our ".hardcoded),

          // PRIVACY POLICY LINK
          TextSpan(
            text: "Privacy Policy".hardcoded,
            style: richTextStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.pushNamed(AppRoute.privacyPolicy.name),
          ),

          TextSpan(text: " and ".hardcoded),

          // TERMS OF USE LINK
          TextSpan(
            text: "Terms of Service".hardcoded,
            style: richTextStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.pushNamed(AppRoute.termsOfService.name),
          ),

          const TextSpan(text: "."),
        ],
      ),
    );
  }
}
