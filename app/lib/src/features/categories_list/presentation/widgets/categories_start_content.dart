import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_list_view.dart';
import 'package:app/src/features/home_detail/presentation/widgets/profile_circular_avator.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';

class CategoriesStartContent extends StatelessWidget {
  const CategoriesStartContent({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Sizes.p12,
        left: Sizes.p8,
        right: Sizes.p4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.loc.categories,
                style: context.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              ProfileCircularAvatar(),
            ],
          ),
          gapH8,
          CategoriesListView(categories: categories),
        ],
      ),
    );
  }
}
