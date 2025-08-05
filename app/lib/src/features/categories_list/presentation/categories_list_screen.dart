import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/core/common_widgets/draggable_two_column_layout.dart';
import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/is_small_screen.dart.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_list_view.dart';
import 'package:app/src/features/categories_list/presentation/widgets/category_skeleton_list.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_end_content.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_start_content.dart';
import 'package:app/src/features/home_detail/presentation/widgets/profile_circular_avator.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesListScreen extends ConsumerWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmall = isSmallScreen(context);
    final categoriesValue = ref.watch(categoriesListStreamProvider);

    return Scaffold(
      appBar: isSmall ? const _CategoriesAppBar() : null,
      body: SafeArea(
        child: isSmall
            ? SmallScreenContent(
                categoriesValue: categoriesValue,
              )
            : LargeScreenContent(
                categoriesValue: categoriesValue,
              ),
      ),
    );
  }
}

class _CategoriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CategoriesAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(context.loc.categories),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: Sizes.p12),
          child: ProfileCircularAvatar(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SmallScreenContent extends StatelessWidget {
  const SmallScreenContent({
    super.key,
    required this.categoriesValue,
  });

  final AsyncValue<List<Category>> categoriesValue;

  @override
  Widget build(BuildContext context) {
    return AsyncValueWidget<List<Category>>(
      value: categoriesValue,
      loading: const CategorySkeletonList(usePadding: true),
      error: (error, _) => CenteredMessageWidget(
        icon: Icons.error_outline,
        title: context.loc.somethingWentWrong,
        message: error.toString(),
        useResponsiveDesign: true,
      ),
      data: (categories) => CategoriesListView(
        usePadding: true,
        useListTile: false,
        categories: categories,
      ),
    );
  }
}

class LargeScreenContent extends StatelessWidget {
  const LargeScreenContent({
    super.key,
    required this.categoriesValue,
  });

  final AsyncValue<List<Category>> categoriesValue;

  @override
  Widget build(BuildContext context) {
    return AsyncValueWidget<List<Category>>(
      value: categoriesValue,
      loading: const DraggableTwoColumnLayout(
        startContent: CategoriesSkeletonStartContent(),
        endContent: CenteredProgressIndicator(),
      ),
      error: (error, _) => MessageScreen(
        showTitle: true,
        showAppBar: true,
        appBarTitle: context.loc.categories,
        icon: Icons.error_outline,
        title: context.loc.somethingWentWrong,
        message: error.toString(),
      ),
      data: (categories) => DraggableTwoColumnLayout(
        startContent: CategoriesStartContent(categories: categories),
        endContent: const CategoriesEndContent(showBackButton: false),
      ),
    );
  }
}