import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/controllers/selected_category_notifier.dart';
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
    final selectedCategoryId = ref.watch(selectedCategoryNotifierProvider);
    final isTileSelected = selectedCategoryId == category.id;
    final icon = getCategoryIcon(category.iconName);

    if (isListTile) {
      return ListTile(
        onTap: onTap,
        selected: isTileSelected,
        shape: RoundedRectangleBorder(borderRadius: .circular(Sizes.p12)),
        contentPadding: .symmetric(horizontal: Sizes.p12, vertical: Sizes.p4),
        selectedTileColor: context.colorScheme.surfaceContainer,
        leading: _IconContainer(size: 42, icon: icon),
        title: _CategoryName(title: category.name),
        subtitle: _CategoryDescription(description: category.description),
      );
    }

    // card-style layout
    return Card(
      child: InkWell(
        borderRadius: .circular(Sizes.p12),
        onTap: onTap,
        child: Padding(
          padding: const .all(Sizes.p24),
          child: Column(
            spacing: Sizes.p12,
            mainAxisSize: .min,
            crossAxisAlignment: .center,
            children: [
              _IconContainer(size: 80, icon: icon, iconSize: 40),
              _CategoryDetails(category: category),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconContainer extends StatelessWidget {
  const _IconContainer({required this.size, required this.icon, this.iconSize});

  final double size;
  final IconData icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: .circular(50),
        color: context.colorScheme.secondaryContainer,
      ),
      child: Icon(icon, size: iconSize),
    );
  }
}

class _CategoryDetails extends StatelessWidget {
  const _CategoryDetails({required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.colorScheme.primary;

    return Column(
      crossAxisAlignment: .center,
      children: [
        _CategoryName(title: category.name),
        gapH4,
        _CategoryDescription(
          description: category.description,
          textAlign: .center,
        ),
        gapH24,
        Row(
          mainAxisAlignment: .end,
          children: [
            Flexible(
              child: Text(
                context.loc.explore,
                style: context.textTheme.titleSmall!.copyWith(
                  color: primaryColor,
                  fontWeight: .w600,
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

class _CategoryName extends StatelessWidget {
  const _CategoryName({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleMedium!.copyWith(fontWeight: .w600),
    );
  }
}

class _CategoryDescription extends StatelessWidget {
  const _CategoryDescription({required this.description, this.textAlign});

  final TextAlign? textAlign;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: context.textTheme.bodyMedium?.copyWith(
        color: context.colorScheme.onSurfaceVariant,
      ),
      textAlign: textAlign,
    );
  }
}
