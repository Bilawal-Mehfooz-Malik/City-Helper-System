import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/controllers/selected_category_controller.dart';
import 'package:app/src/features/home/presentation/home_screen.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesEndContent extends ConsumerWidget {
  const CategoriesEndContent({
    super.key,
    this.showBackButton = true,
    required this.categoriesValue,
  });

  final bool showBackButton;
  final AsyncValue<List<Category>> categoriesValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryIdControllerProvider);

    if (selectedCategory == null) {
      return Center(child: Text(context.loc.selectCategoryBody));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
      child: HomeScreen(
        categoryId: selectedCategory,
        showBackButton: showBackButton,
      ),
    );
  }
}
