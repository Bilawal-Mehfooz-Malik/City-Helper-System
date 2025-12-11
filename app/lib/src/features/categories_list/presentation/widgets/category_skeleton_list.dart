import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/widgets/category_card.dart';
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
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: shrinkWrap,
        separatorBuilder: (context, index) => gapH4,
        padding: usePadding
            ? .symmetric(vertical: Sizes.p8, horizontal: Sizes.p24)
            : null,
        itemBuilder: (_, _) => CategoryCard(
          isListTile: useListTile,
          category: Category(
            id: 1,
            name: BoneMock.name,
            description: BoneMock.words(8),
            iconName: 'residence',
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
        padding: .symmetric(horizontal: Sizes.p8),
        child: Column(
          spacing: Sizes.p12,
          crossAxisAlignment: .start,
          children: [
            Padding(
              padding: .only(top: Sizes.p12, left: Sizes.p12),
              child: Text(
                BoneMock.name,
                style: context.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CategorySkeletonList(useListTile: true),
          ],
        ),
      ),
    );
  }
}
