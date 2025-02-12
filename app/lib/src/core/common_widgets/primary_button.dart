import 'package:flutter/material.dart';

import 'custom_progress_indicator.dart';

/// Primary button based on [FilledButton].
/// Useful for CTAs in the app.
/// @param text - text to display on the button.
/// @param isLoading - if true, a loading indicator will be displayed instead of
/// the text.
/// @param onPressed - callback to be called when the button is pressed.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
    return FilledButton(
      onPressed: isDisabled ? null : onPressed,
      child: isLoading
          ? const CenteredProgressIndicator()
          : Text(text, textAlign: TextAlign.center),
    );
  }
}
