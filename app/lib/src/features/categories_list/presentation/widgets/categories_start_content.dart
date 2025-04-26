import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_list_view.dart';
import 'package:app/src/features/categories_list/presentation/widgets/category_skeleton_list.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesStartContent extends StatelessWidget {
  const CategoriesStartContent({super.key, required this.categoriesValue});

  final AsyncValue<List<Category>> categoriesValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Sizes.p12, left: Sizes.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
            child: Text(
              context.loc.categories,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          gapH8,
          AsyncValueWidget<List<Category>>(
            value: categoriesValue,
            error: (_, __) => const SizedBox.shrink(),
            loading: const CategorySkeletonList(useListTile: true),
            data: (categories) => CategoriesListView(categories: categories),
          ),
        ],
      ),
    );
  }
}
