import 'package:flutter/material.dart';

import '../../core/common_widgets/responsive_scrollable.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/breakpoints.dart';
import 'get_started_content.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    // Always use scrollable if width < 200 or height < 400
    if (width < Breakpoint.lowerWidth || height < Breakpoint.lowerHeight) {
      return const Scaffold(
        body: SafeArea(
          child: ResponsiveScrollable(
            child: GetStartedContent(),
          ),
        ),
      );
    }

    // For larger screens (e.g., tablet or wider)
    return Scaffold(
      body: SafeArea(
        child: width > Breakpoint.tablet
            ? const Center(
                child: ResponsiveScrollable(
                  showCardWidget: true,
                  child: GetStartedContent(),
                ),
              )
            : const Padding(
                padding: EdgeInsets.all(Sizes.p16),
                child: GetStartedContent(useSpacer: true),
              ),
      ),
    );
  }
}
