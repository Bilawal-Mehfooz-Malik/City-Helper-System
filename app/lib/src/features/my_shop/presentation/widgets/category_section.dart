import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final List<Category> allCategories;
  final List<SubCategory> subCategoryOptions;
  final Category? selectedCategory;
  final SubCategory? selectedSubCategory;
  final ValueChanged<Category?> onCategoryChanged;
  final ValueChanged<SubCategory?> onSubCategoryChanged;
  final bool isEditing;

  const CategorySection({
    super.key,
    required this.allCategories,
    required this.subCategoryOptions,
    required this.selectedCategory,
    required this.selectedSubCategory,
    required this.onCategoryChanged,
    required this.onSubCategoryChanged,
    this.isEditing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: DropdownButtonFormField<Category>(
            value: selectedCategory,
            decoration: InputDecoration(
              labelText: 'Category *'.hardcoded,
              border: const OutlineInputBorder(),
              filled: isEditing,
            ),
            items: allCategories
                .map(
                  (cat) => DropdownMenuItem(value: cat, child: Text(cat.name)),
                )
                .toList(),
            // FIX: Disable the dropdown by setting onChanged to null if editing
            onChanged: isEditing ? null : onCategoryChanged,
            validator: (value) => value == null ? 'Required'.hardcoded : null,
          ),
        ),
        gapW8,
        Expanded(
          flex: 3,
          child: SubCategoryDropdown(
            subCategoryOptions: subCategoryOptions,
            selectedSubCategory: selectedSubCategory,
            onChanged: selectedCategory == null ? null : onSubCategoryChanged,
          ),
        ),
      ],
    );
  }
}

class SubCategoryDropdown extends StatelessWidget {
  final List<SubCategory> subCategoryOptions;
  final SubCategory? selectedSubCategory;
  final ValueChanged<SubCategory?>? onChanged;

  const SubCategoryDropdown({
    super.key,
    required this.subCategoryOptions,
    required this.selectedSubCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<SubCategory>(
      value: selectedSubCategory,
      decoration: InputDecoration(
        labelText: 'Choose Sub Category *'.hardcoded,
        border: const OutlineInputBorder(),
      ),
      items: subCategoryOptions
          .map((sub) => DropdownMenuItem(value: sub, child: Text(sub.name)))
          .toList(),
      onChanged: onChanged,
      disabledHint: Text('Select a category first'.hardcoded),
    );
  }
}
