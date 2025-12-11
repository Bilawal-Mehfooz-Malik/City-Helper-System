import 'package:flutter/material.dart';

import 'custom_progress_indicator.dart';

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
    return SizedBox(
      width: useMaxSize ? .infinity : null,
      child: FilledButton(
        style: FilledButton.styleFrom(textStyle: TextStyle(fontWeight: .w500)),
        onPressed: isDisabled || isLoading ? null : onPressed,
        child: isLoading
            ? CustomCircularProgressIndicator()
            : Text(text, textAlign: .center),
      ),
    );
  }
}
