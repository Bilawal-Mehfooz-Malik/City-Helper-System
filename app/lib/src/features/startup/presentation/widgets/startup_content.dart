import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_logo.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';

const kGetStartedKey = ValueKey('Get-Started');

class StartupContent extends StatelessWidget {
  const StartupContent({
    super.key,
    this.useSpacer = false,
    required this.onGetStarted,
    required this.isLargeScreen,
  });

  final bool useSpacer;
  final bool isLargeScreen;
  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (useSpacer) const Spacer(flex: 2) else gapH12,

        const AppLogo(height: 80, width: 80),
        gapH20,

        Text(
          context.loc.appTitle,
          style: context.textTheme.headlineLarge!.copyWith(
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),

        if (useSpacer) const Spacer(flex: 3) else gapH48,

        Text(
          context.loc.startupHeadline,
          style: context.textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        ),
        gapH8,

        Text(
          context.loc.startupDescription,
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),

        if (useSpacer) const Spacer(flex: 2) else if (!isLargeScreen) gapH32,

        if (!isLargeScreen)
          PrimaryButton(
            key: kGetStartedKey,
            useMaxSize: true,
            text: context.loc.getStarted,
            onPressed: onGetStarted,
          ),

        if (useSpacer) const Spacer() else if (!isLargeScreen) gapH12,
      ],
    );
  }
}
