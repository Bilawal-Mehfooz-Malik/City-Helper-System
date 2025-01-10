import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_logo.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/startup/presentation/startup_content/startup_bottom_sheet_content.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';

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
        if (useSpacer) const Spacer() else gapH32,

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
      enableDrag: false,
      useSafeArea: true,
      showDragHandle: true,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) =>
          const ResponsiveScrollable(child: StartupBottomSheetContent()),
    );
  }
}
