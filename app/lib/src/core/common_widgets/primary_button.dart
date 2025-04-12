import 'package:app/src/themes/theme_helpers.dart';
import 'package:flutter/material.dart';

import 'custom_progress_indicator.dart';

/// Primary button based on [FilledButton].
/// Useful for CTAs in the app.
/// @param text - text to display on the button.
/// @param isLoading - if true, a loading indicator will be displayed instead of
/// the text.
/// @param isDisabled - if true, the onPressed callBack is disabled
/// @param onPressed - callback to be called when the button is pressed.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
