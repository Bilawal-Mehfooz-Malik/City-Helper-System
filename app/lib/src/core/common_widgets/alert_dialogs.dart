import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:app/src/localization/string_hardcoded.dart';

const kDialogDefaultKey = Key('dialog-default-key');

/// Helper function for showing an adaptive alert dialog
/// Returns:
/// - true if the default action was selected
/// - false if the cancel action was selected
/// - null if the dialog was dismissed
Future<bool?> showAlertDialog({
  required BuildContext context,
  required String title,
  String? content,
  String? cancelActionText,
  required String defaultActionText,
  VoidCallback? defaultAction,
  VoidCallback? cancelAction,
  bool barrierDismissible = true,
  bool isDestructive = false,
}) {
  return showAdaptiveDialog<bool?>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) => AlertDialog.adaptive(
      title: Text(title),
      content: content != null && content.isNotEmpty ? Text(content) : null,
      actions: <Widget>[
        if (cancelActionText != null)
          _adaptiveAction(
            context: context,
            onPressed: cancelAction ?? () => Navigator.pop(context, false),
            child: Text(cancelActionText),
          ),
        _adaptiveAction(
          context: context,
          isDestructive: isDestructive,
          onPressed: defaultAction ?? () => Navigator.pop(context, true),
          child: Text(defaultActionText),
        ),
      ],
    ),
  );
}

/// Helper function for showing an adaptive action
/// Returns:
/// - TextButton if the platform is not iOS or macOS
/// - CupertinoDialogAction if the platform is iOS or macOS
Widget _adaptiveAction({
  required BuildContext context,
  required VoidCallback onPressed,
  required Widget child,
  bool isDestructive = false,
}) {
  final platform = context.theme.platform;
  if (platform != .iOS && platform != .macOS) {
    return TextButton(onPressed: onPressed, child: child);
  } else {
    return CupertinoDialogAction(
      onPressed: onPressed,
      isDestructiveAction: isDestructive,
      child: child,
    );
  }
}

/// Generic function to show a platform-aware Material or Cupertino error dialog
Future<void> showExceptionAlertDialog({
  required BuildContext context,
  required String title,
  required dynamic exception,
}) => showAlertDialog(
  context: context,
  title: title,
  content: exception.toString(),
  defaultActionText: 'OK'.hardcoded,
);

// Snack Bar Custom
void showSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
