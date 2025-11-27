import '/src/core/constants/app_sizes.dart';
import '/src/core/constants/breakpoints.dart';
import '/src/core/common_widgets/responsive_scrollable.dart';
import '/src/core/utils/responsive_wrapper.dart';
import '/src/core/common_widgets/responsive_center.dart';
import '/src/core/utils/theme_extension.dart';
import '/src/features/startup/presentation/widgets/startup_content.dart';
import 'package:flutter/material.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.sizeOf(context).width < Breakpoint.desktop;
    return Scaffold(
      backgroundColor: isSmall
          ? context.colorScheme.surface
          : context.colorScheme.surfaceContainerHighest,
      body: SafeArea(
        child: ResponsiveWrapper(
          smallHeight: ResponsiveScrollable(
            child: StartupContent(
              isLargeScreen: true,
              borderRadius: 0.0,
              padding: .fromLTRB(Sizes.p24, Sizes.p40, Sizes.p24, Sizes.p32),
            ),
          ),
          mobile: StartupContent(
            isLargeScreen: false,
            borderRadius: 0.0,
            padding: .fromLTRB(Sizes.p24, Sizes.p40, Sizes.p24, Sizes.p32),
          ),
          tablet: StartupContent(
            isLargeScreen: false,
            padding: .all(Sizes.p32),
          ),
          desktop: ResponsiveCenter(
            maxContentWidth: Breakpoint.tablet,
            child: StartupContent(
              isLargeScreen: true,
              padding: .all(Sizes.p24),
            ),
          ),
        ),
      ),
    );
  }
}
