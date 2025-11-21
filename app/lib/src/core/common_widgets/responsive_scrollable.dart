import 'package:app/src/core/common_widgets/responsive_center_beta.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveScrollable extends StatelessWidget {
  const ResponsiveScrollable({
    super.key,
    required this.child,
    this.maxContentWidth = Breakpoint.desktop,
  });
  final Widget child;
  final double maxContentWidth;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveCenter(maxContentWidth: maxContentWidth, child: child),
    );
  }
}

class ResponsiveScrollableSliver extends StatelessWidget {
  const ResponsiveScrollableSliver({
    super.key,
    required this.child,
    this.maxContentWidth = Breakpoint.desktop,
  });
  final Widget child;
  final double maxContentWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveSliverCenter(
        maxContentWidth: maxContentWidth,
        child: child,
      ),
    );
  }
}
