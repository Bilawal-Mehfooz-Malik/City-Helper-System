import 'package:app/src/core/common_widgets/alert_dialogs.dart';
import 'package:app/src/core/exceptions/error_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueUI on AsyncValue<Object?> {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      final uiError = mapExceptionToUI(error!);

      showAlertDialog(
        context: context,
        title: uiError.title,
        content: uiError.message,
        cancelActionText: uiError.cancel,
        defaultActionText: uiError.confirm,
        defaultAction: () async {
          Navigator.of(context).pop();
          if (uiError.onConfirm != null) {
            await uiError.onConfirm!();
          }
        },
      );
    }
  }
}
