import 'package:app/src/core/common_widgets/alert_dialogs.dart';
import 'package:app/src/features/startup/domain/location_exceptions.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      if (error == LocationPermissionDeniedForeverException()) {
        showAlertDialog(
          context: context,
          useFilledButton: true,
          title: 'Location Permission Denied'.hardcoded,
          content: LocationPermissionDeniedForeverException().message,
          cancelActionText: 'cancel'.hardcoded,
          defaultActionText: 'Go to Settings'.hardcoded,
          defaultAction: () async {
            context.pop();
            await Geolocator.openAppSettings();
          },
        );
      } else if (error == LocationServicesDisabledException()) {
        showAlertDialog(
          context: context,
          useFilledButton: true,
          title: 'Location Permission Denied'.hardcoded,
          content: LocationServicesDisabledException().message,
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
