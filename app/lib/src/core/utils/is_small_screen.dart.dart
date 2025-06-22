import 'package:app/src/core/constants/breakpoints.dart';
import 'package:flutter/material.dart';

bool isSmallScreen(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  final screenType = ScreenType.determine(
    width: size.width,
    height: size.height,
  );
  return screenType == ScreenType.smallHeight ||
      screenType == ScreenType.mobile;
}
