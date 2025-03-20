import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/themes/theme_helpers.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
    this.useMinimumSize = false,
    this.onPressed,
  });

  final String text;
  final bool isLoading;
  final bool isDisabled;
  final bool useMinimumSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: useMinimumSize ? ThemeHelpers.buttonSize() : null,
      ),
      onPressed: isDisabled ? null : onPressed,
      child:
          isLoading
              ? const CenteredProgressIndicator()
              : Text(text, textAlign: TextAlign.center),
    );
  }
}
