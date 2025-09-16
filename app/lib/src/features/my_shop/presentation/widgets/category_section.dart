import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final List<Category> allCategories;
  final List<SubCategory> subCategoryOptions;
  final Category? selectedCategory;
  final SubCategory? selectedSubCategory;
  final ListingType? selectedListingType;
  final ValueChanged<Category?> onCategoryChanged;
  final ValueChanged<SubCategory?> onSubCategoryChanged;
  final ValueChanged<ListingType?> onListingTypeChanged;
  final bool isEditing;

  const CategorySection({
    super.key,
    required this.allCategories,
    required this.subCategoryOptions,
    required this.selectedCategory,
    required this.selectedSubCategory,
    required this.selectedListingType,
    required this.onCategoryChanged,
    required this.onSubCategoryChanged,
    required this.onListingTypeChanged,
    this.isEditing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonFormField<Category>(
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
          onChanged: isEditing ? null : onCategoryChanged,
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  child: child,
                ),
              );
            },
            child: (selectedCategory != null)
                ? Padding(
                    padding: const EdgeInsets.only(top: Sizes.p12),
                    child: SubCategoryDropdown(
                      subCategoryOptions: subCategoryOptions,
                      selectedSubCategory: selectedSubCategory,
                      onChanged: onSubCategoryChanged,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
        if (selectedCategory?.id == 1)
          Padding(
            padding: const EdgeInsets.only(top: Sizes.p12),
            child: DropdownButtonFormField<ListingType>(
              value: selectedListingType,
              decoration: InputDecoration(
                labelText: 'Listing Type *'.hardcoded,
                border: const OutlineInputBorder(),
              ),
              items: ListingType.values
                  .map(
                    (lt) => DropdownMenuItem(value: lt, child: Text(lt.name)),
                  )
                  .toList(),
              onChanged: onListingTypeChanged,
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
    this.onChanged,
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
