import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/draggable_two_column_layout.dart';
import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/common_widgets/error_filled_button.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/categories_list_view.dart';
import 'package:app/src/features/categories_list/presentation/category_skeleton_list.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_end_content.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_start_content.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesListScreen extends ConsumerWidget {
  const CategoriesListScreen({super.key});

  void _refresh(WidgetRef ref) {
    ref.invalidate(categoriesListFutureProvider);
  }

  bool _isSmallScreen(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenType = ScreenType.determine(
      width: size.width,
      height: size.height,
    );
    return screenType == ScreenType.smallHeight ||
        screenType == ScreenType.mobile;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmall = _isSmallScreen(context);
    final categoriesValue = ref.watch(categoriesListFutureProvider);

    return Scaffold(
      appBar: isSmall ? AppBar(title: Text(context.loc.categories)) : null,
      body: SafeArea(
        child:
            isSmall
                ? SmallScreenContent(
                  categoriesValue: categoriesValue,
                  onRefresh: () => _refresh(ref),
                )
                : LargeScreenContent(
                  categoriesValue: categoriesValue,
                  onRefresh: () => _refresh(ref),
                ),
      ),
    );
  }
}

class SmallScreenContent extends StatelessWidget {
  const SmallScreenContent({
    super.key,
    required this.categoriesValue,
    required this.onRefresh,
  });

  final VoidCallback onRefresh;
  final AsyncValue<List<Category>> categoriesValue;

  @override
  Widget build(BuildContext context) {
    return AsyncValueWidget<List<Category>>(
      value: categoriesValue,
      loading: const CategorySkeletonList(usePadding: true),
      error:
          (error, _) => CenteredMessageWidget(
            title: context.loc.somethingWentWrong,
            message: error.toString(),
            icon: Icons.error_outline,
            useResponsiveDesign: true,
            actions: ErrorFilledButton(
              text: context.loc.refresh,
              onPressed: onRefresh,
              useMaxSize: true,
            ),
          ),
      data:
          (categories) => CategoriesListView(
            categories: categories,
            useListTile: false,
            usePadding: true,
          ),
    );
  }
}

class LargeScreenContent extends StatelessWidget {
  const LargeScreenContent({
    super.key,
    required this.categoriesValue,
    required this.onRefresh,
  });

  final AsyncValue<List<Category>> categoriesValue;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return categoriesValue.maybeWhen(
      error:
          (error, _) => MessageScreen(
            showTitle: true,
            showAppBar: true,
            title: context.loc.somethingWentWrong,
            message: error.toString(),
            icon: Icons.error_outline,
            appBarTitle: context.loc.categories,
            actions: ErrorFilledButton(
              text: context.loc.refresh,
              onPressed: onRefresh,
            ),
          ),
      orElse:
          () => DraggableTwoColumnLayout(
            startContent: CategoriesStartContent(
              categoriesValue: categoriesValue,
            ),
            endContent: CategoriesEndContent(categoriesValue: categoriesValue),
          ),
    );
  }
}
