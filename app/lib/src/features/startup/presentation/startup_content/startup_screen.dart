import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/features/startup/presentation/startup_content/startup_content.dart';
import 'package:flutter/material.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    // For Smaller Screens (width < 250 or height < 500)
    if (width <= Breakpoint.lowerWidth || height <= Breakpoint.lowerHeight) {
      return const Scaffold(
        body: SafeArea(child: ResponsiveScrollable(child: StartupContent())),
      );
    }

    // For larger screens (e.g., tablet or wider)
    return Scaffold(
      body: SafeArea(
        child:
            width > Breakpoint.mobile
                ? const Center(
                  child: ResponsiveScrollable(
                    showCardWidget: true,
                    child: StartupContent(),
                  ),
                )
                // For Mobile Screen
                : const Padding(
                  padding: EdgeInsets.all(Sizes.p16),
                  child: StartupContent(useSpacer: true),
                ),
      ),
    );
  }
}
