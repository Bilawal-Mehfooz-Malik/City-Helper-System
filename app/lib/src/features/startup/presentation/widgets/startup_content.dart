import 'package:app/src/localization/string_hardcoded.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';

import '/src/core/common_widgets/primary_button.dart';
import '/src/core/constants/app_logo.dart';
import '/src/core/constants/app_sizes.dart';
import '/src/core/utils/theme_extension.dart';
import '/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';

const kGetStartedKey = ValueKey('Get-Started');

class StartupContent extends StatelessWidget {
  const StartupContent({
    super.key,
    required this.isLargeScreen,
    required this.padding,
    this.borderRadius = Sizes.p16,
  });

  final EdgeInsetsGeometry padding;
  final bool isLargeScreen;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: .circular(borderRadius),
      ),
      child: Padding(
        padding: padding,
        child: Column(
          spacing: isLargeScreen ? Sizes.p40 : 0,
          mainAxisSize: isLargeScreen ? .min : .max,
          mainAxisAlignment: isLargeScreen ? .start : .spaceBetween,
          children: [
            _AppLogoAndName(),
            _HeadlineAndDescription(),
            _BottomCTA(),
          ],
        ),
      ),
    );
  }
}

class _HeadlineAndDescription extends StatelessWidget {
  const _HeadlineAndDescription();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Sizes.p8,
      children: [
        Text(
          context.loc.startupHeadline,
          style: context.textTheme.headlineSmall!.copyWith(fontWeight: .w600),
          textAlign: .center,
        ),
        Text(
          context.loc.startupDescription,
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          textAlign: .center,
        ),
      ],
    );
  }
}

class _AppLogoAndName extends StatelessWidget {
  const _AppLogoAndName();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Sizes.p16,
      children: [
        const AppLogo(height: 80, width: 80),
        Text(
          context.loc.appTitle,
          style: context.textTheme.headlineLarge!.copyWith(fontWeight: .w700),
          textAlign: .center,
        ),
      ],
    );
  }
}

class _BottomCTA extends StatelessWidget {
  const _BottomCTA();

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
        PrimaryButton(
          key: kGetStartedKey,
          useMaxSize: true,
          text: context.loc.getStarted,
          onPressed: () => context.pushNamed(AppRoute.pickYourLocation.name),
        ),
        RichText(
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
                  ..onTap = () =>
                      context.pushNamed(AppRoute.privacyPolicy.name),
              ),

              TextSpan(text: " and ".hardcoded),

              // TERMS OF USE LINK
              TextSpan(
                text: "Terms of Service".hardcoded,
                style: richTextStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () =>
                      context.pushNamed(AppRoute.termsOfService.name),
              ),

              const TextSpan(text: "."),
            ],
          ),
        ),
      ],
    );
  }
}
