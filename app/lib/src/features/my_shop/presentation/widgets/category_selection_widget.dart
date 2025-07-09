import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/my_shop/presentation/widgets/sub_category_dropdown.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategorySelectionSection extends ConsumerWidget {
  final Category? selectedCategory;
  final SubCategory? selectedSubCategory;
  final ValueChanged<Category?> onCategoryChanged;
  final ValueChanged<SubCategory?> onSubCategoryChanged;

  const CategorySelectionSection({
    super.key,
    required this.selectedCategory,
    required this.selectedSubCategory,
    required this.onCategoryChanged,
    required this.onSubCategoryChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesListFutureProvider);

    return Column(
      spacing: Sizes.p8,
      children: [
        AsyncValueWidget(
          value: categoriesAsync,
          data: (categories) => DropdownButtonFormField<Category>(
            value: selectedCategory,
            decoration: InputDecoration(labelText: 'Choose Category'.hardcoded),
            items: categories
                .map(
                  (cat) => DropdownMenuItem(value: cat, child: Text(cat.name)),
                )
                .toList(),
            onChanged: onCategoryChanged,
          ),
        ),
        if (selectedCategory != null)
          SubCategoryDropdown(
            categoryId: selectedCategory!.id,
            selectedSubCategory: selectedSubCategory,
            onChanged: onSubCategoryChanged,
          ),
      ],
    );
  }
}
