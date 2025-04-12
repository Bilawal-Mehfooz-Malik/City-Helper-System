import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';

/// A responsive card widget to display a category in grid or list tile format.
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    this.onTap,
    this.isListTile = false,
  });

  final Category category;
  final VoidCallback? onTap;
  final bool isListTile;

  @override
  Widget build(BuildContext context) {
    final greenColor = context.colorScheme.primary;

    if (isListTile) {
      return ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Sizes.p16,
          vertical: Sizes.p8,
        ),
        leading: CircleAvatar(radius: Sizes.p24, child: Icon(category.icon)),
        title: CategoryName(title: category.name),
        subtitle: CategoryDescription(description: category.description),
      );
    }

    // grid-style layout
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Icon(
                  category.icon,
                  size: 100,
                  color: context.colorScheme.onSurface,
                ),
              ),
              gapH8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryName(title: category.name),
                  gapH4,
                  CategoryDescription(description: category.description),
                  gapH24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        context.loc.explore,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: greenColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_right_alt, color: greenColor),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryName extends StatelessWidget {
  const CategoryName({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: context.textTheme.titleMedium);
  }
}

class CategoryDescription extends StatelessWidget {
  const CategoryDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(description, style: context.textTheme.labelMedium);
  }
}
