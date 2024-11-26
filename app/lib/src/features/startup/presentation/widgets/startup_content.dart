import 'package:flutter/material.dart';

import '../../../../core/common_widgets/primary_button.dart';
import '../../../../core/common_widgets/responsive_scrollable.dart';
import '../../../../core/constants/app_logo.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/theme_extension.dart';
import '../../../../localization/localization_extension.dart';
import 'startup_bottom_sheet_content.dart';

class StartupContent extends StatelessWidget {
  const StartupContent({super.key, this.useSpacer = false});

  final bool useSpacer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // [Logo and Title]
        if (useSpacer) const Spacer() else gapH12,

        const AppLogo(height: 80, width: 80),
        gapH20,
        Text(
          context.loc.appTitle,
          style: context.textTheme.headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        if (useSpacer) const Spacer(flex: 2) else gapH32,

        // Subtitle
        Text(
          context.loc.startupHeadline,
          style: context.textTheme.headlineMedium!
              .copyWith(fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
        gapH24,

        // [Description]
        Text(
          context.loc.startupDescription,
          style: context.textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        if (useSpacer) const Spacer() else gapH32,

        // [Get Started Button]
        PrimaryButton(
          text: context.loc.getStarted,
          onPressed: () => _showLocationDialog(context),
        ),
        if (useSpacer) const Spacer() else gapH12,
      ],
    );
  }

  Future<dynamic> _showLocationDialog(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) =>
          const ResponsiveScrollable(child: StartupBottomSheetContent()),
    );
  }
}
