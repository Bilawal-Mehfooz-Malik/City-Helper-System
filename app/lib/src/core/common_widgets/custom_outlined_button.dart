import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';

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
    return SizedBox(
      width: useMaxSize ? .infinity : null,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          textStyle: TextStyle(fontWeight: .w500),
        ),
        onPressed: isDisabled || isLoading ? null : onPressed,
        child: isLoading
            ? const CustomCircularProgressIndicator()
            : Text(text, textAlign: .center),
      ),
    );
  }
}
