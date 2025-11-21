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
    this.padding = Sizes.p16,
    this.borderRadius = Sizes.p16,
  });

  final double padding;
  final bool isLargeScreen;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisSize: .min,
          children: [
            if (!isLargeScreen) const Spacer(flex: 2) else gapH12,

            const AppLogo(height: 80, width: 80),
            gapH20,

            Text(
              context.loc.appTitle,
              style: context.textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            if (!isLargeScreen) const Spacer(flex: 3) else gapH48,

            Text(
              context.loc.startupHeadline,
              style: context.textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            gapH8,

            Text(
              context.loc.startupDescription,
              style: context.textTheme.bodyLarge!.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),

            if (!isLargeScreen) const Spacer(flex: 2) else gapH32,

            PrimaryButton(
              key: kGetStartedKey,
              useMaxSize: true,
              text: context.loc.getStarted,
              onPressed: () {},
            ),

            if (!isLargeScreen) const Spacer() else gapH12,
          ],
        ),
      ),
    );
  }
}
