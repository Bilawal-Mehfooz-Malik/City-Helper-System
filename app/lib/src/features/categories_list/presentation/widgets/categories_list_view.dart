import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/controllers/selected_category_view_controller.dart';
import 'package:app/src/features/categories_list/presentation/widgets/category_card.dart';
import 'package:app/src/features/categories_list/presentation/controllers/selected_category_controller.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.categories,
    this.useListTile = true,
    this.usePadding = false,
  });

  final bool useListTile;
  final bool usePadding;
  final List<Category> categories;

  /// Handles the tap event on a category card.
  /// It determines the screen type and navigates accordingly.
  /// It also resets the subcategory state when a category is selected.
  void _onTap(BuildContext context, WidgetRef ref, CategoryId id) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenType = ScreenType.determine(
      width: screenSize.width,
      height: screenSize.height,
    );
    // Reset the subcategory state when a category is selected
    // and set the selected category view to home.
    ref.read(subcategoryControllerProvider.notifier).resetSubcategoryState();
    ref
        .read(selectedCategoryViewControllerProvider.notifier)
        .setSelectedCategoryView(SelectedCategoryView.home);

    if (screenType == ScreenType.tablet || screenType == ScreenType.desktop) {
      ref.read(selectedCategoryNotifierProvider.notifier).setCategoryId(id);
    } else {
      context.goNamed(
        AppRoute.home.name,
        pathParameters: {'categoryId': id.toString()},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return CenteredMessageWidget(message: NoCategoryFoundException().message);
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      padding: usePadding
          ? EdgeInsets.symmetric(vertical: Sizes.p8, horizontal: Sizes.p16)
          : null,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Consumer(
          builder: (ctx, ref, _) {
            return CategoryCard(
              category: category,
              isListTile: useListTile,
              onTap: () => _onTap(ctx, ref, category.id),
            );
          },
        );
      },
    );
  }
}
