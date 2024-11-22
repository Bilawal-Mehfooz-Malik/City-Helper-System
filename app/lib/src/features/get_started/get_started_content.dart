import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/common_widgets/primary_button.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/utils/theme_extension.dart';
import '../../localization/string_hardcoded.dart';

class GetStartedContent extends StatelessWidget {
  const GetStartedContent({super.key, this.useSpacer = false});

  final bool useSpacer;

  @override
  Widget build(BuildContext context) {
    const logoPath = 'assets/logo/app_logo.svg';

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // [Logo and Title]
        if (useSpacer) const Spacer() else gapH12,

        SvgPicture.asset(logoPath),
        gapH20,
        Text(
          'FindOut'.hardcoded,
          style: context.textTheme.headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        if (useSpacer) const Spacer() else gapH32,

        // Subtitle
        Text(
          'Discover Amazing Places'.hardcoded,
          style: context.textTheme.headlineMedium!
              .copyWith(fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
        gapH12,

        // Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Text(
            'Easily find any place in Mirpur, any time and anywhere, using your smartphone.'
                .hardcoded,
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        if (useSpacer) const Spacer(flex: 2) else gapH32,

        // Primary Button
        PrimaryButton(
          text: 'Get Started'.hardcoded,
          onPressed: () {},
        ),
        if (useSpacer) const Spacer() else gapH12,
      ],
    );
  }
}
