import 'package:app/src/features/startup/presentation/widgets/bottom_cta_section.dart';

import '/src/core/constants/app_logo.dart';
import '/src/core/constants/app_sizes.dart';
import '/src/core/utils/theme_extension.dart';
import '/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';

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
            BottomCTASection(),
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
