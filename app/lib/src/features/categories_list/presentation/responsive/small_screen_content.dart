import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_list_view.dart';
import 'package:app/src/features/categories_list/presentation/widgets/category_feedback_handler.dart';
import 'package:app/src/features/categories_list/presentation/widgets/category_skeleton_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SmallScreenContent extends ConsumerWidget {
  const SmallScreenContent({super.key, required this.categoriesValue});

  final AsyncValue<List<Category>> categoriesValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget<List<Category>>(
      value: categoriesValue,
      loading: const CategorySkeletonList(usePadding: true),
      error: (e, _) => CategoryFeedbackHandler.error(
        error: e,
        isSmallScreen: true,
        onRefresh: () => ref.refresh(categoriesListFutureProvider),
      ),
      data: (categories) {
        if (categories.isEmpty) {
          return CategoryFeedbackHandler.empty(
            isSmallScreen: true,
            onRefresh: () => ref.refresh(categoriesListFutureProvider),
          );
        }
        return CategoriesListView(
          usePadding: true,
          useListTile: false,
          categories: categories,
        );
      },
    );
  }
}
