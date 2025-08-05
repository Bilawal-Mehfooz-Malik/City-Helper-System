import 'dart:io';

import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/core/common_widgets/draggable_two_column_layout.dart';
import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_end_content.dart';
import 'package:app/src/features/categories_list/presentation/widgets/categories_start_content.dart';
import 'package:app/src/features/categories_list/presentation/widgets/category_skeleton_list.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LargeScreenContent extends StatelessWidget {
  const LargeScreenContent({super.key, required this.categoriesValue});

  final AsyncValue<List<Category>> categoriesValue;

  @override
  Widget build(BuildContext context) {
    return AsyncValueWidget<List<Category>>(
      value: categoriesValue,
      loading: const DraggableTwoColumnLayout(
        startContent: CategoriesSkeletonStartContent(),
        endContent: CenteredProgressIndicator(),
      ),
      error: (error, _) {
        final message = error is SocketException
            ? "You appear to be offline. Please check your internet connection.".hardcoded
            : "An unexpected error occurred. Please try again later.".hardcoded;
        return MessageScreen(
          showTitle: true,
          showAppBar: true,
          appBarTitle: context.loc.categories,
          icon: Icons.error_outline,
          title: context.loc.somethingWentWrong,
          message: message,
        );
      },
      data: (categories) {
        if (categories.isEmpty) {
          return MessageScreen(
            showTitle: true,
            showAppBar: true,
            appBarTitle: context.loc.categories,
            icon: Icons.question_mark_rounded,
            title: "No Categories Found".hardcoded,
            message: "There are currently no categories to display. Please check back later.".hardcoded,
          );
        }
        return DraggableTwoColumnLayout(
          startContent: CategoriesStartContent(categories: categories),
          endContent: const CategoriesEndContent(showBackButton: false),
        );
      },
    );
  }
}
