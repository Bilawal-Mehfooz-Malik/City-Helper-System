import 'dart:math';

import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  /// Total number of items to display.
  final int itemCount;

  /// Function used to build a widget for a given index in the grid.
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return CenteredMessageWidget(NoCategoryFoundException().message);
    }

    return Padding(
      padding: const EdgeInsets.all(Sizes.p12),
      child: LayoutBuilder(
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
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: AlignedGridView.count(
              itemCount: itemCount,
              itemBuilder: itemBuilder,
              crossAxisCount: crossAxisCount,
            ),
          );
        },
      ),
    );
  }
}
