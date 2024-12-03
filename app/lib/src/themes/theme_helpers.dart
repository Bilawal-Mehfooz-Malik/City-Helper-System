import 'package:flutter/material.dart';

import '../core/constants/app_sizes.dart';

RoundedRectangleBorder borderRadius() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Sizes.p8),
  );
}

WidgetStatePropertyAll<RoundedRectangleBorder> shape() {
  return WidgetStatePropertyAll(borderRadius());
}

WidgetStatePropertyAll<Size?> buttonSize() {
  return const WidgetStatePropertyAll(Size(double.infinity, Sizes.p48));
}
