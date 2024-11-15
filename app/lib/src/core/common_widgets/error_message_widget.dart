import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(this.errorMessage, {super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: context.textTheme.titleLarge!.copyWith(color: Colors.red),
    );
  }
}
