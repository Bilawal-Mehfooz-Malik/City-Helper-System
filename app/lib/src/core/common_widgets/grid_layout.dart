import 'dart:math';

import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    this.physics,
    this.shrinkWrap = false,
    required this.itemCount,
    required this.itemBuilder,
    required this.emptyMessage,
    this.useResponsivePadding = false,
  });

  /// Total number of items to display.
  final int itemCount;

  /// Function used to build a widget for a given index in the grid.
  final Widget Function(BuildContext, int) itemBuilder;

  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final String emptyMessage;
  final bool useResponsivePadding;

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return CenteredMessageWidget(message: emptyMessage);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final maxWidth = min(width, Breakpoint.desktop);
        final crossAxisCount = max(1, maxWidth ~/ 300);
        // calculate a "responsive" padding that increases
        // when the width is greater than the desktop breakpoint
        // this is used to center the content horizontally on large screens
        final padding =
            width > Breakpoint.desktop + Sizes.p32
                ? (width - Breakpoint.desktop) / 2
                : Sizes.p16;

        return Padding(
          padding:
              useResponsivePadding
                  ? EdgeInsets.symmetric(
                    horizontal: padding,
                    vertical: Sizes.p16,
                  )
                  : EdgeInsets.zero,
          child: AlignedGridView.count(
            physics: physics,
            shrinkWrap: shrinkWrap,
            itemCount: itemCount,
            itemBuilder: itemBuilder,
            crossAxisCount: crossAxisCount,
          ),
        );
      },
    );
  }
}
