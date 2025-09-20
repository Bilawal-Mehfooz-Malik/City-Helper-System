import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/themes/theme_helpers.dart';
import 'package:flutter/material.dart';

/// @param text - text to display on the button.
/// @param isLoading - if true, a loading indicator will be displayed instead of
/// the text.
/// @param isDisabled - if true, the onPressed callBack is disabled
/// @param onPressed - callback to be called when the button is pressed.
class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
    this.useMaxSize = false,
    this.onPressed,
    this.style,
  });

  final String text;
  final bool isLoading;
  final bool isDisabled;
  final bool useMaxSize;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: useMaxSize ? ThemeHelpers.buttonSize() : null,
      ).merge(style),
      onPressed: isDisabled || isLoading ? null : onPressed,
      child: isLoading
          ? const CenteredProgressIndicator()
          : Text(text, textAlign: TextAlign.center),
    );
  }
}
