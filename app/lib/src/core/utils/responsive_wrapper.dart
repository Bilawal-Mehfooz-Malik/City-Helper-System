import '/src/core/constants/breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget? smallHeight;
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveWrapper({
    super.key,
    this.smallHeight,
    this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    if (height < Breakpoint.smallHeight && smallHeight != null) {
      return smallHeight!;
    }

    if (width >= Breakpoint.desktop && desktop != null) {
      return desktop!;
    } else if (width >= Breakpoint.tablet && tablet != null) {
      return tablet!;
    } else if (mobile != null) {
      return mobile!;
    }

    return SizedBox();
  }
}
