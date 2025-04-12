import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/categories_list/domain/categories_exception.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/category_card.dart';
import 'package:app/src/features/categories_list/presentation/selected_category_controller.dart';
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

  void _onTap(BuildContext context, WidgetRef ref, CategoryId id) {
    final screenType = ScreenType.determine(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
    );

    if (screenType == ScreenType.tablet || screenType == ScreenType.desktop) {
      ref.read(selectedCategoryIdControllerProvider.notifier).setCategoryId(id);
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
      return CenteredMessageWidget(NoCategoryFoundException().message);
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      padding:
          usePadding
              ? EdgeInsets.symmetric(vertical: Sizes.p8, horizontal: Sizes.p16)
              : null,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Consumer(
          builder: (context, ref, _) {
            return CategoryCard(
              category: category,
              isListTile: useListTile,
              onTap: () => _onTap(context, ref, category.id),
            );
          },
        );
      },
    );
  }
}
