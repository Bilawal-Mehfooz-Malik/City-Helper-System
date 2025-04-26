import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/themes/theme_helpers.dart';
import 'package:flutter/material.dart';

class ErrorFilledButton extends StatelessWidget {
  const ErrorFilledButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
    this.useMaxSize = false,
    this.onPressed,
  });

  final String text;
  final bool isLoading;
  final bool isDisabled;
  final bool useMaxSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: context.colorScheme.error,
        foregroundColor: context.colorScheme.onError,
        minimumSize: useMaxSize ? ThemeHelpers.buttonSize() : null,
      ),
      onPressed: isDisabled ? null : onPressed,
      child:
          isLoading
              ? const CenteredProgressIndicator()
              : Text(text, textAlign: TextAlign.center),
    );
  }
}
