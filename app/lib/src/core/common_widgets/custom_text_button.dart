import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.useMaxSize = false,
    this.onPressed,
  });
  final String text;
  final bool isLoading;
  final bool useMaxSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: useMaxSize ? .infinity : null,
      child: TextButton(
        style: TextButton.styleFrom(textStyle: TextStyle(fontWeight: .w500)),
        onPressed: onPressed,
        child: isLoading
            ? const CustomCircularProgressIndicator()
            : Text(text, textAlign: .center),
      ),
    );
  }
}
