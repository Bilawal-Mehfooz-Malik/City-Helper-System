import 'error_message_widget.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String exception;
  const ErrorScreen({super.key, required this.exception});

  @override
  Widget build(BuildContext context) {
    return ErrorMessageWidget(exception);
  }
}
