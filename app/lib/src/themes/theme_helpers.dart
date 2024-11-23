import 'package:flutter/material.dart';

import '../core/constants/app_sizes.dart';

WidgetStatePropertyAll<RoundedRectangleBorder> shape() {
  return WidgetStatePropertyAll(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.p8)),
  );
}

WidgetStatePropertyAll<Size?> buttonSize() {
  return const WidgetStatePropertyAll(Size(double.infinity, Sizes.p48));
}
