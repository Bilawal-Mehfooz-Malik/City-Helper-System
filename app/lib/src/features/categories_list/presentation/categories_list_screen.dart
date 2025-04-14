import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/draggable_two_column_layout.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/categories_list_view.dart';
import 'package:app/src/features/categories_list/presentation/category_skeleton_list.dart';
import 'package:app/src/features/categories_list/presentation/selected_category_controller.dart';
import 'package:app/src/features/home/presentation/home_screen.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kCategoriesListScreen = Key('categories-list-screen');

class CategoriesListScreen extends ConsumerWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenType = ScreenType.determine(
      width: screenSize.width,
      height: screenSize.height,
    );
    final isSmall =
        screenType == ScreenType.smallHeight || screenType == ScreenType.mobile;

    final categoriesValue = ref.watch(categoriesListStreamProvider);

    return Scaffold(
      key: kCategoriesListScreen,
      appBar: isSmall ? AppBar(title: Text(context.loc.categories)) : null,
      body: SafeArea(
        child:
            isSmall
                ? AsyncValueWidget(
                  value: categoriesValue,
                  loading: CategorySkeletonList(usePadding: true),
                  data:
                      (categories) => CategoriesListView(
                        useListTile: false,
                        usePadding: true,
                        categories: categories,
                      ),
                )
                : DraggableTwoColumnLayout(
                  startContent: CategoriesStartContent(
                    categoriesValue: categoriesValue,
                  ),
                  endContent: CategoriesEndContent(
                    categoriesValue: categoriesValue,
                  ),
                ),
      ),
    );
  }
}

class CategoriesStartContent extends StatelessWidget {
  const CategoriesStartContent({super.key, required this.categoriesValue});

  final AsyncValue<List<Category>> categoriesValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
      child: Column(
        spacing: Sizes.p8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
            child: Text(
              context.loc.categories,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AsyncValueWidget(
            value: categoriesValue,
            loading: CategorySkeletonList(useListTile: true),
            data: (categories) => CategoriesListView(categories: categories),
          ),
        ],
      ),
    );
  }
}

class CategoriesEndContent extends ConsumerWidget {
  const CategoriesEndContent({super.key, required this.categoriesValue});

  final AsyncValue<List<Category>> categoriesValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryIdControllerProvider);

    return selectedCategory == null
        ? Center(child: Text(context.loc.selectCategoryBody))
        : Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
          child: HomeScreen(categoryId: selectedCategory),
        );
  }
}
