import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/my_data_types.dart';

class CategorySection extends ConsumerWidget {
  final Category? selectedCategory;
  final SubCategory? selectedSubCategory;
  final ValueChanged<Category?> onCategoryChanged;
  final ValueChanged<SubCategory?> onSubCategoryChanged;

  const CategorySection({
    super.key,
    required this.selectedCategory,
    required this.selectedSubCategory,
    required this.onCategoryChanged,
    required this.onSubCategoryChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesListFutureProvider);

    return Row(
      spacing: Sizes.p8,
      children: [
        Expanded(
          flex: 2,
          child: AsyncValueWidget(
            value: categoriesAsync,
            data: (categories) => DropdownButtonFormField<Category>(
              value: selectedCategory,
              decoration: InputDecoration(
                labelText: 'Choose Category'.hardcoded,
                border: OutlineInputBorder(),
              ),
              items: categories
                  .map(
                    (cat) =>
                        DropdownMenuItem(value: cat, child: Text(cat.name)),
                  )
                  .toList(),
              onChanged: onCategoryChanged,
            ),
          ),
        ),

        Expanded(
          flex: 3,
          child: SubCategoryDropdown(
            categoryId: selectedCategory?.id ?? -1,
            selectedSubCategory: selectedSubCategory,
            onChanged: selectedCategory == null
                ? null // disables dropdown when no category
                : onSubCategoryChanged,
            isEnabled: selectedCategory != null,
          ),
        ),
      ],
    );
  }
}

class SubCategoryDropdown extends ConsumerWidget {
  final CategoryId categoryId;
  final SubCategory? selectedSubCategory;
  final ValueChanged<SubCategory?>? onChanged;
  final bool isEnabled;

  const SubCategoryDropdown({
    super.key,
    required this.categoryId,
    required this.selectedSubCategory,
    required this.onChanged,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subCategoriesAsync = ref.watch(
      subCategoriesListFutureProvider(categoryId),
    );
    return AsyncValueWidget(
      value: subCategoriesAsync,
      data: (subCategories) => DropdownButtonFormField<SubCategory>(
        value: selectedSubCategory,
        decoration: InputDecoration(
          labelText: 'Choose Sub Category'.hardcoded,
          border: OutlineInputBorder(),
        ),
        items: subCategories
            .map((sub) => DropdownMenuItem(value: sub, child: Text(sub.name)))
            .toList(),
        onChanged: isEnabled ? onChanged : null,
        disabledHint: Text('Select a category first'.hardcoded),
      ),
    );
  }
}
