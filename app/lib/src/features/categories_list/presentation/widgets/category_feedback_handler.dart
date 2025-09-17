import 'dart:io';

import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

/// A helper widget that returns a centered message for error and empty states,
/// adapting its presentation for small vs. large screens.
class CategoryFeedbackHandler extends StatelessWidget {
  const CategoryFeedbackHandler.error({
    super.key,
    required this.error,
    required this.isSmallScreen,
    this.onRefresh,
  })  : isEmpty = false,
        _message = null,
        _title = null;

  CategoryFeedbackHandler.empty({super.key, required this.isSmallScreen})
      : error = null,
        isEmpty = true,
        onRefresh = null,
        _title = "No Categories Found".hardcoded,
        _message =
            "There are currently no categories to display. Please check back later."
                .hardcoded;

  final Object? error;
  final bool isEmpty;
  final bool isSmallScreen;
  final VoidCallback? onRefresh;
  final String? _title;
  final String? _message;

  @override
  Widget build(BuildContext context) {
    final title = isEmpty ? _title! : context.loc.somethingWentWrong;
    final message = isEmpty
        ? _message!
        : error is SocketException
            ? "You appear to be offline. Please check your internet connection."
                .hardcoded
            : "An unexpected error occurred. Please try again later.".hardcoded;

    final button = onRefresh != null
        ? FilledButton(
            onPressed: onRefresh,
            child: Text("Refresh".hardcoded),
          )
        : null;

    if (isSmallScreen) {
      return CenteredMessageWidget(
        icon: isEmpty ? Icons.question_mark_rounded : Icons.error_outline,
        title: title.hardcoded,
        message: message.hardcoded,
        useResponsiveDesign: true,
        actions: button,
      );
    }

    return MessageScreen(
      showTitle: true,
      showAppBar: true,
      appBarTitle: context.loc.categories,
      icon: isEmpty ? Icons.question_mark_rounded : Icons.error_outline,
      title: title.hardcoded,
      message: message.hardcoded,
      actions: button,
    );
  }
}
