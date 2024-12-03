import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/src/localization/string_hardcoded.dart';
import 'package:app/src/core/common_widgets/alert_dialogs.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      if (error == 'Location-Permission-Denied-Forever') {
        showAlertDialog(
          context: context,
          title: 'Location Permission Denied'.hardcoded,
          content:
              'This app requires access to location permissions to function properly. Please enable the permission in settings to continue.'
                  .hardcoded,
          cancelActionText: 'cancel'.hardcoded,
          defaultActionText: 'Go to Settings'.hardcoded,
          defaultAction: () async {
            context.pop();
            await Geolocator.openAppSettings();
          },
        );
      } else if (error == 'Location-Services-Not-Enabled') {
        showAlertDialog(
          context: context,
          title: 'Location Permission Denied'.hardcoded,
          content:
              'This app requires access to location permissions to function properly. Please enable the permission in settings to continue.'
                  .hardcoded,
          cancelActionText: 'cancel'.hardcoded,
          defaultActionText: 'Go to Settings'.hardcoded,
          defaultAction: () async {
            context.pop();
            await Geolocator.openLocationSettings();
          },
        );
      } else {
        showExceptionAlertDialog(
          context: context,
          title: 'Error'.hardcoded,
          exception: error,
        );
      }
    }
  }
}
