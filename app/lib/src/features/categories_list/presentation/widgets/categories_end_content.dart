import 'package:app/src/features/categories_list/presentation/selected_category_controller.dart';
import 'package:app/src/features/categories_list/presentation/selected_category_view_controller.dart';
import 'package:app/src/features/home/presentation/home_screen.dart';
import 'package:app/src/features/home/presentation/popular_entities_list_screen.dart';
import 'package:app/src/features/home_detail/presentation/controllers/entity_id_controller.dart';
import 'package:app/src/features/review/home_detail_screen.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesEndContent extends ConsumerWidget {
  const CategoriesEndContent({super.key, this.showBackButton = true});

  final bool showBackButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final view = ref.watch(selectedCategoryViewControllerProvider);
    final selectedCategory = ref.watch(selectedCategoryIdControllerProvider);
    final entityId = ref.watch(entityIdControllerProvider);

    if (selectedCategory == null) {
      return Center(child: Text(context.loc.selectCategoryBody));
    }
    return switch (view) {
      SelectedCategoryView.home => HomeScreen(
        categoryId: selectedCategory,
        showBackButton: false,
      ),
      SelectedCategoryView.popular => PopularEntitiesListScreen(
        categoryId: selectedCategory,
        isPushed: false,
      ),
      SelectedCategoryView.detail => HomeDetailScreen(
        categoryId: selectedCategory,
        entityId: entityId,
        isPushed: false,
      ),
    };
  }
}
