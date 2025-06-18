import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/widgets/category_card.dart';
import 'package:app/src/localization/localization_extension.dart';
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
        padding: usePadding
            ? EdgeInsets.symmetric(vertical: Sizes.p8, horizontal: Sizes.p16)
            : null,
        itemBuilder: (_, __) => CategoryCard(
          isListTile: useListTile,
          category: Category(
            id: 1,
            name: BoneMock.name,
            description: BoneMock.words(8),
            icon: Icons.category,
            sortOrder: 1,
          ),
        ),
      ),
    );
  }
}

class CategoriesSkeletonStartContent extends StatelessWidget {
  const CategoriesSkeletonStartContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.only(top: Sizes.p12, left: Sizes.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.loc.categories,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Bone.icon(),
                ],
              ),
            ),
            gapH8,
            const CategorySkeletonList(useListTile: true),
          ],
        ),
      ),
    );
  }
}
