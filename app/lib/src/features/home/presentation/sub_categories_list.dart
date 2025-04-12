import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// * Fetches and displays a list of subcategories as chips**
/// - Uses Riverpod to listen for category changes
/// - Wraps the list inside an `AsyncValueWidget` for state handling
class SubCategoriesList extends ConsumerWidget {
  final CategoryId categoryId;
  const SubCategoriesList({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watches the subcategories list for the given categoryId
    final subCategoryValue = ref.watch(
      subCategoriesListFutureProvider(categoryId),
    );

    return SizedBox(
      height: 50,
      child: AsyncValueWidget(
        value: subCategoryValue,
        data: (subCategories) {
          if (subCategories.isEmpty) {
            return SizedBox.shrink();
          }

          return SubCategoryChipListView(
            categoryId: categoryId,
            subCategories: subCategories,
          );
        },
      ),
    );
  }
}

/// * Displays a horizontal list of subcategory chips**
/// - Adds an "All" option at the start
/// - Uses `.map()` for cleaner iteration
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
      SubCategory(id: 0, name: 'All'.hardcoded, categoryId: categoryId),
      ...subCategories,
    ];

    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: Sizes.p12),
      children:
          allSubCategories
              .map(
                (subCategory) =>
                    SubCategoryChipWidget(subCategory: subCategory),
              )
              .toList(),
    );
  }
}

/// **Represents an individual subcategory chip**
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

    return Padding(
      padding: const EdgeInsets.only(right: Sizes.p4),
      child: ChoiceChip(
        selected: isSelected,
        label: Text(subCategory.name),
        onSelected: (selected) => onSelected(selected),
      ),
    );
  }
}
