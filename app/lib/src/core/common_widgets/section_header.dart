import 'package:app/src/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.startWidget,
    required this.endWidget,
    this.padding = const EdgeInsets.symmetric(horizontal: Sizes.p16),
  });

  final Widget startWidget;
  final Widget endWidget;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Flexible(child: startWidget), Flexible(child: endWidget)],
      ),
    );
  }
}
