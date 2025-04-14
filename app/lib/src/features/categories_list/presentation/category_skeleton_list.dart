import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/category_card.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategorySkeletonList extends StatelessWidget {
  const CategorySkeletonList({
    super.key,
    this.useListTile = false,
    this.itemCount = 2,
    this.shrinkWrap = true,
    this.usePadding = false,
  });

  final bool useListTile;
  final int itemCount;
  final bool shrinkWrap;
  final bool usePadding;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: itemCount,
        shrinkWrap: shrinkWrap,
        padding:
            usePadding
                ? EdgeInsets.symmetric(
                  vertical: Sizes.p8,
                  horizontal: Sizes.p16,
                )
                : null,
        itemBuilder:
            (_, __) => CategoryCard(
              isListTile: useListTile,
              category: Category(
                id: 1,
                name: 'Lorem Ipsum'.hardcoded,
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                        .hardcoded,
                icon: Icons.category,
                sortOrder: 1,
                createdAt: DateTime.now(),
              ),
            ),
      ),
    );
  }
}
