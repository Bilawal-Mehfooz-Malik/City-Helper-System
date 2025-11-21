import 'package:app/src/core/common_widgets/responsive_center_beta.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:flutter/material.dart';

/// Scrollable widget that shows a responsive card with a given child widget.
/// Useful for displaying forms and other widgets that need to be scrollable.
class ResponsiveScrollable extends StatelessWidget {
  const ResponsiveScrollable({
    super.key,
    required this.child,
    this.showCard = false,
    this.padding = EdgeInsets.zero,
    this.paddingInsideCard = EdgeInsets.zero,
    this.maxContentWidth = Breakpoint.desktop,
  });
  final Widget child;
  final bool showCard;
  final double maxContentWidth;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry paddingInsideCard;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveCenter(
        padding: padding,
        showCard: showCard,
        paddingInsideCard: paddingInsideCard,
        maxContentWidth: maxContentWidth,
        child: child,
      ),
    );
  }
}

class ResponsiveScrollableSliver extends StatelessWidget {
  const ResponsiveScrollableSliver({
    super.key,
    required this.child,
    this.showCard = false,
    this.padding = EdgeInsets.zero,
    this.paddingInsideCard = EdgeInsets.zero,
  });
  final Widget child;
  final bool showCard;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry paddingInsideCard;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveSliverCenter(
        padding: padding,
        maxContentWidth: Breakpoint.tablet,
        child: showCard == true
            ? Card(
                child: Padding(padding: paddingInsideCard, child: child),
              )
            : child,
      ),
    );
  }
}
