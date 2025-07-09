import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubCategoryDropdown extends ConsumerWidget {
  final CategoryId categoryId;
  final SubCategory? selectedSubCategory;
  final ValueChanged<SubCategory?> onChanged;

  const SubCategoryDropdown({
    super.key,
    required this.categoryId,
    required this.selectedSubCategory,
    required this.onChanged,
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
        decoration: InputDecoration(labelText: 'Choose Sub Category'.hardcoded),
        items: subCategories
            .map((sub) => DropdownMenuItem(value: sub, child: Text(sub.name)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
