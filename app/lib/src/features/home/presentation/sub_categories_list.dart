import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/home_skeletons.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Displays a horizontal list of subcategory chips for the selected category
/// - Shows a skeleton while loading
/// - Hides the list if there are no subcategories
/// - Injects the categoryId to filter subcategories
class SubCategoriesList extends ConsumerWidget {
  final CategoryId categoryId;

  const SubCategoriesList({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the async subcategories provider for the given categoryId
    final subCategoryValue = ref.watch(
      subCategoriesListStreamProvider(categoryId),
    );

    return AsyncValueWidget<List<SubCategory>>(
      value: subCategoryValue,
      loading: const SubCategorySkeletonList(),
      error: (error, stackTrace) => SizedBox.shrink(),
      data: (subCategories) {
        // Return an empty widget if there are no subcategories
        if (subCategories.isEmpty) {
          return const SizedBox.shrink();
        }

        // Show the list of subcategory chips
        return SubCategoryChipListView(
          categoryId: categoryId,
          subCategories: subCategories,
        );
      },
    );
  }
}

/// * Displays a horizontal list of subcategory chips
/// - Adds an "All" option at the start
class SubCategoryChipListView extends StatelessWidget {
  final CategoryId categoryId;
  final List<SubCategory> subCategories;

  const SubCategoryChipListView({
    super.key,
    required this.categoryId,
    required this.subCategories,
  });

  @override
  Widget build(BuildContext context) {
    // Add a default "All" option to reset filtering
    final allSubCategories = [
      SubCategory(id: 0, name: context.loc.all, categoryId: categoryId),
      ...subCategories,
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: Row(
        children:
            allSubCategories
                .map(
                  (subCategory) => Padding(
                    padding: const EdgeInsets.only(right: Sizes.p8),
                    child: SubCategoryChipWidget(subCategory: subCategory),
                  ),
                )
                .toList(),
      ),
    );
  }
}

/// * Represents an individual subcategory chip
/// - Highlights selected category
/// - Calls `selectSubcategory()` on selection
class SubCategoryChipWidget extends ConsumerWidget {
  final SubCategory subCategory;
  const SubCategoryChipWidget({super.key, required this.subCategory});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watches the currently selected subcategory
    final selectedSubcategory = ref.watch(subcategoryControllerProvider);

    // Determines if the chip is selected
    final isSelected =
        (selectedSubcategory == null && subCategory.id == 0) ||
        (selectedSubcategory == subCategory.id);

    // Selects or resets subcategory filter
    void onSelected(bool selected) {
      if (selected) {
        ref
            .read(subcategoryControllerProvider.notifier)
            .selectSubcategory(subCategory.id == 0 ? null : subCategory.id);
      }
    }

    return ChoiceChip(
      selected: isSelected,
      label: Text(subCategory.name),
      onSelected: (selected) => onSelected(selected),
    );
  }
}
