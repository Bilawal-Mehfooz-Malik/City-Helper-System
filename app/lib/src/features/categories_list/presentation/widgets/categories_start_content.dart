import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_list_view.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class CategoriesStartContent extends StatelessWidget {
  const CategoriesStartContent({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: Sizes.p8),
      child: Column(
        spacing: Sizes.p12,
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: .only(top: Sizes.p12, left: Sizes.p12),
            child: Text(
              'Explore'.hardcoded,
              style: context.textTheme.titleLarge!.copyWith(fontWeight: .w600),
            ),
          ),
          CategoriesListView(categories: categories),
        ],
      ),
    );
  }
}
