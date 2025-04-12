import 'package:flutter/material.dart';
import 'package:app/src/core/constants/app_sizes.dart';

class ThemeHelpers {
  ThemeHelpers._();

  static Size? buttonSize() => Size(double.infinity, Sizes.p40);

  static Radius borderRadius() => Radius.circular(Sizes.p12);

  static BorderRadius borderRadiusAll() => BorderRadius.all(borderRadius());

  static BorderRadius borderRadiusAllRounded() =>
      BorderRadius.all(Radius.circular(25));
}
