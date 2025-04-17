import 'dart:math';

import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/home_skeletons.dart';
import 'package:app/src/features/home/presentation/widgets/entity_card.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EntitiesListSection extends ConsumerWidget {
  final CategoryId categoryId;
  const EntitiesListSection({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subCategory = ref.watch(subcategoryControllerProvider);
    final entitiesListValue = ref.watch(
      WatchEntitiesProvider(categoryId, subCategory),
    );

    // Show skeleton while loading
    if (entitiesListValue.isLoading) {
      return const EntitiesListSkeleton();
    }

    // Extract the data from the AsyncValue
    final entities = entitiesListValue.value;

    // Return an empty widget if there are no entities
    if (entities == null || entities.isEmpty) {
      return const SizedBox.shrink();
    }

    // Show the list of entities
    return Column(
      spacing: Sizes.p4,
      children: [
        SectionHeader(
          startWidget: Text(
            'Nearby'.hardcoded,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          endWidget: Icon(Icons.filter_list_alt, size: 30),
        ),

        EntitiesGridLayout(
          shrinkWrap: true,
          itemCount: entities.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.p4,
                horizontal: Sizes.p16,
              ),
              child: EntityCard(entity: entities[index], useElipsis: false),
            );
          },
          emptyMessage: NoEntityFoundException().message,
        ),
      ],
    );
  }
}

class EntitiesGridLayout extends StatelessWidget {
  const EntitiesGridLayout({
    super.key,
    this.physics,
    this.shrinkWrap = false,
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

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return CenteredMessageWidget(emptyMessage);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final maxWidth = min(width, Breakpoint.desktop);
        final crossAxisCount = max(1, maxWidth ~/ 250);

        return AlignedGridView.count(
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
