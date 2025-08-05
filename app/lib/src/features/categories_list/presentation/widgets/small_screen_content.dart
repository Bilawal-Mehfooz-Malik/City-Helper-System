import 'dart:io';

import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_list_view.dart';
import 'package:app/src/features/categories_list/presentation/widgets/category_skeleton_list.dart';
import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SmallScreenContent extends StatelessWidget {
  const SmallScreenContent({super.key, required this.categoriesValue});

  final AsyncValue<List<Category>> categoriesValue;

  @override
  Widget build(BuildContext context) {
    return AsyncValueWidget<List<Category>>(
      value: categoriesValue,
      loading: const CategorySkeletonList(usePadding: true),
      error: (error, _) {
        final message = error is SocketException
            ? "You appear to be offline. Please check your internet connection.".hardcoded
            : "An unexpected error occurred. Please try again later.".hardcoded;
        return CenteredMessageWidget(
          icon: Icons.error_outline,
          title: context.loc.somethingWentWrong,
          message: message,
          useResponsiveDesign: true,
        );
      },
      data: (categories) {
        if (categories.isEmpty) {
          return CenteredMessageWidget(
            icon: Icons.question_mark_rounded,
            title: "No Categories Found".hardcoded,
            message: "There are currently no categories to display. Please check back later.".hardcoded,
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
