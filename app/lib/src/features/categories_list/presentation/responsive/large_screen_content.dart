import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/core/common_widgets/draggable_two_column_layout.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_end_content.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_start_content.dart';
import 'package:app/src/features/categories_list/presentation/widgets/category_feedback_handler.dart';
import 'package:app/src/features/categories_list/presentation/widgets/category_skeleton_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LargeScreenContent extends ConsumerWidget {
  const LargeScreenContent({super.key, required this.categoriesValue});

  final AsyncValue<List<Category>> categoriesValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget<List<Category>>(
      value: categoriesValue,
      loading: const DraggableTwoColumnLayout(
        startContent: CategoriesSkeletonStartContent(),
        endContent: CenteredProgressIndicator(),
      ),
      error: (e, _) => CategoryFeedbackHandler.error(
        error: e,
        isSmallScreen: false,
        onRefresh: () => ref.refresh(categoriesListFutureProvider),
      ),
      data: (categories) {
        if (categories.isEmpty) {
          return CategoryFeedbackHandler.empty(isSmallScreen: false);
        }
        return DraggableTwoColumnLayout(
          startContent: CategoriesStartContent(categories: categories),
          endContent: const CategoriesEndContent(showBackButton: false),
        );
      },
    );
  }
}
