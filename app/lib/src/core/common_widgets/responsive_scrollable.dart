import 'package:app/src/core/common_widgets/responsive_center.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:flutter/material.dart';

/// Scrollable widget that shows a responsive card with a given child widget.
/// Useful for displaying forms and other widgets that need to be scrollable.
class ResponsiveScrollable extends StatelessWidget {
  const ResponsiveScrollable({
    super.key,
    required this.child,
    this.maxHeight,
    this.showCardWidget = false,
  });
  final Widget child;
  final double? maxHeight;
  final bool showCardWidget;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveCenter(
        maxContentWidth: Breakpoint.tablet,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: showCardWidget == true
              ? Card(
                  child: Padding(
                    padding: const EdgeInsets.all(Sizes.p16),
                    child: child,
                  ),
                )
              : child,
        ),
      ),
    );
  }
}
