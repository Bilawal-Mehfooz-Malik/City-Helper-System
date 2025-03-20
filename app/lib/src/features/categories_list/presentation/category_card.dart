import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:flutter/material.dart';

/// A card widget to display a category with its name and icon.
class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, this.onTap, required this.category});

  final Category category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final greenColor = context.colorScheme.primary;
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start, // Align text left
            children: [
              Center(
                // Centering the icon
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
                  Text(category.name, style: context.textTheme.titleMedium),
                  gapH4,
                  Text(
                    category.description,
                    style: context.textTheme.labelLarge,
                  ),
                  gapH24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: Sizes.p4,
                    children: [
                      Text(
                        'Explore',
                        style: TextStyle(
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
