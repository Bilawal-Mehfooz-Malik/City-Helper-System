import 'dart:io';

import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:app/src/localization/string_hardcoded.dart';

import '../constants/app_sizes.dart';

const kDialogDefaultKey = Key('dialog-default-key');

/// Generic function to show a platform-aware Material or Cupertino dialog
Future<bool?> showAlertDialog({
  required BuildContext context,
  required String title,
  String? content,
  String? cancelActionText,
  String defaultActionText = 'OK',
  bool useFilledButton = false,
  VoidCallback? defaultAction,
  VoidCallback? cancelAction,
}) async {
  return showDialog(
    context: context,
    // * Only make the dialog dismissible if there is a cancel button
    barrierDismissible: cancelActionText != null,
    // * AlertDialog.adaptive was added in Flutter 3.13
    builder: (context) => AlertDialog.adaptive(
      title: Text(title),
      content: content != null ? Text(content) : null,
      // * Use [TextButton] or [CupertinoDialogAction] depending on the platform
      actions: kIsWeb || !Platform.isIOS
          ? <Widget>[
              if (cancelActionText != null)
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: context.colorScheme.secondary,
                  ),
                  child: Text(cancelActionText),
                  onPressed: () {
                    if (cancelAction != null) {
                      cancelAction();
                    } else {
                      Navigator.of(context).pop(false);
                    }
                  },
                ),
              if (useFilledButton)
                FilledButton(
                  key: kDialogDefaultKey,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(0, Sizes.p48),
                  ),
                  child: Text(defaultActionText),
                  onPressed: () {
                    if (defaultAction != null) {
                      defaultAction();
                    } else {
                      Navigator.of(context).pop(true);
                    }
                  },
                )
              else
                TextButton(
                  key: kDialogDefaultKey,
                  child: Text(defaultActionText),
                  onPressed: () {
                    if (defaultAction != null) {
                      defaultAction();
                    } else {
                      Navigator.of(context).pop(true);
                    }
                  },
                ),
            ]
          : <Widget>[
              if (cancelActionText != null)
                CupertinoDialogAction(
                  child: Text(cancelActionText),
                  onPressed: () {
                    if (cancelAction != null) {
                      cancelAction();
                    } else {
                      Navigator.of(context).pop(false);
                    }
                  },
                ),
              CupertinoDialogAction(
                key: kDialogDefaultKey,
                child: Text(defaultActionText),
                onPressed: () {
                  if (defaultAction != null) {
                    defaultAction();
                  } else {
                    Navigator.of(context).pop(true);
                  }
                },
              ),
            ],
    ),
  );
}

/// Generic function to show a platform-aware Material or Cupertino error dialog
Future<void> showExceptionAlertDialog({
  required BuildContext context,
  required String title,
  required dynamic exception,
}) =>
    showAlertDialog(
      context: context,
      title: title,
      content: exception.toString(),
      defaultActionText: 'OK'.hardcoded,
    );

Future<void> showNotImplementedAlertDialog({required BuildContext context}) =>
    showAlertDialog(context: context, title: 'Not implemented'.hardcoded);
