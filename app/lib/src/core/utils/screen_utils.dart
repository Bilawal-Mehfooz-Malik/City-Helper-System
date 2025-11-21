import '/src/core/constants/breakpoints.dart';
import 'package:flutter/material.dart';

ScreenType screenTypeOf(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;

  if (width >= Breakpoint.desktop) return ScreenType.desktop;
  if (width >= Breakpoint.tablet) return ScreenType.tablet;
  return ScreenType.mobile;
}

bool isSmallHeightScreen(BuildContext context) {
  final height = MediaQuery.sizeOf(context).height;
  return height < Breakpoint.smallHeight;
}

bool isMobileScreen(BuildContext context) {
  return screenTypeOf(context) == ScreenType.mobile;
}
