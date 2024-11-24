import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
    this.onPressed,
  });

  final String text;
  final bool isLoading;
  final bool isDisabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isDisabled ? null : onPressed,
      child: isLoading
          ? const CustomProgressIndicator()
          : Text(text, textAlign: TextAlign.center),
    );
  }
}
