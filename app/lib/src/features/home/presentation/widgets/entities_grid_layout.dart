import 'dart:math';

import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EntitiesGridLayout extends StatelessWidget {
  const EntitiesGridLayout({
    super.key,
    this.physics,
    this.shrinkWrap = false,
    this.mainAxisSpacing = Sizes.p8,
    this.crossAxisSpacing = Sizes.p8,
    this.paddingOutside = const EdgeInsets.symmetric(horizontal: Sizes.p16),
    required this.itemCount,
    required this.itemBuilder,
    required this.emptyMessage,
  });

  /// Total number of items to display.
  final int itemCount;

  /// Function used to build a widget for a given index in the grid.
  final Widget Function(BuildContext, int) itemBuilder;

  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final String emptyMessage;
  final EdgeInsets paddingOutside;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: CenteredMessageWidget(message: emptyMessage),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final maxWidth = min(width, Breakpoint.desktop);
        final crossAxisCount = max(1, maxWidth ~/ 250);

        return AlignedGridView.count(
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          padding: paddingOutside,
          physics: physics,
          shrinkWrap: shrinkWrap,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
          crossAxisCount: crossAxisCount,
        );
      },
    );
  }
}
