import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/draggable_two_column_layout.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/categories_list_view.dart';
import 'package:app/src/features/categories_list/presentation/selected_category_controller.dart';
import 'package:app/src/features/home/presentation/home_screen.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kCategoriesListScreen = Key('categories-list-screen');

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;
    final screenType = ScreenType.determine(width: width, height: height);
    final isSmallScreen =
        screenType == ScreenType.smallHeight || screenType == ScreenType.mobile;

    return Scaffold(
      key: kCategoriesListScreen,
      appBar:
          isSmallScreen ? AppBar(title: Text(context.loc.categories)) : null,
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final categoriesListValue = ref.watch(categoriesListFutureProvider);

            return AsyncValueWidget(
              value: categoriesListValue,
              data:
                  (categories) => switch (screenType) {
                    ScreenType.smallHeight => CategoriesListView(
                      useListTile: false,
                      usePadding: true,
                      categories: categories,
                    ),
                    ScreenType.mobile => CategoriesListView(
                      useListTile: false,
                      usePadding: true,
                      categories: categories,
                    ),
                    ScreenType.tablet => DraggableTwoColumnLayout(
                      startContent: CategoriesStartContent(
                        categories: categories,
                      ),
                      endContent: CategoriesEndContent(),
                    ),
                    ScreenType.desktop => DraggableTwoColumnLayout(
                      startContent: CategoriesStartContent(
                        categories: categories,
                      ),
                      endContent: CategoriesEndContent(),
                    ),
                  },
            );
          },
        ),
      ),
    );
  }
}

class CategoriesStartContent extends StatelessWidget {
  const CategoriesStartContent({super.key, required this.categories});
  final List<Category> categories;
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
          CategoriesListView(categories: categories),
        ],
      ),
    );
  }
}

class CategoriesEndContent extends ConsumerWidget {
  const CategoriesEndContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryIdControllerProvider);
    if (selectedCategory == null) {
      return Center(child: Text('Select a category'.hardcoded));
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
        child: HomeScreen(categoryId: selectedCategory),
      );
    }
  }
}
