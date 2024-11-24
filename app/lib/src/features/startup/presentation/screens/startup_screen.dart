import 'package:flutter/material.dart';

import '../../../../core/common_widgets/responsive_scrollable.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/breakpoints.dart';
import '../widgets/startup_content.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    // For Smaller Screens (width < 200 or height < 400)
    if (width < Breakpoint.lowerWidth || height < Breakpoint.lowerHeight) {
      return const Scaffold(
        body: SafeArea(
          child: ResponsiveScrollable(
            child: StartupContent(),
          ),
        ),
      );
    }

    // For larger screens (e.g., tablet or wider)
    return Scaffold(
      body: SafeArea(
        child: width > Breakpoint.mobile
            ? const Center(
                child: ResponsiveScrollable(
                  showCardWidget: true,
                  child: StartupContent(),
                ),
              )
            : const Padding(
                padding: EdgeInsets.all(Sizes.p16),
                child: StartupContent(useSpacer: true),
              ),
      ),
    );
  }
}
