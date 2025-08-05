import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/controllers/selected_category_controller.dart';
import 'package:app/src/core/utils/category_icon_mapper.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A responsive card widget to display a category in grid or list tile format.
class CategoryCard extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryId = ref.watch(selectedCategoryIdControllerProvider);
    final isTileSelected = selectedCategoryId == category.id;
    final icon = getCategoryIcon(category.iconName);

    if (isListTile) {
      return ListTile(
        onTap: onTap,
        selected: isTileSelected,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.p8),
        ),
        contentPadding: const EdgeInsets.all(Sizes.p8),
        selectedColor: context.colorScheme.onPrimaryContainer,
        selectedTileColor: context.colorScheme.primaryContainer.withAlpha(77),
        leading: CircleAvatar(radius: Sizes.p24, child: Icon(icon)),
        title: CategoryName(title: category.name),
        subtitle: CategoryDescription(description: category.description),
      );
    }

    // card-style layout
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Icon(icon, size: 100)),
              gapH8,
              CategoryDetails(category: category),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryName(title: category.name),
        gapH4,
        CategoryDescription(description: category.description),
        gapH24,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                context.loc.explore,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(Icons.arrow_right_alt, color: primaryColor),
          ],
        ),
      ],
    );
  }
}

class CategoryName extends StatelessWidget {
  const CategoryName({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CategoryDescription extends StatelessWidget {
  const CategoryDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(description, style: context.textTheme.labelLarge);
  }
}
