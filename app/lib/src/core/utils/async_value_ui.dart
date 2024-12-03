import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

import '../../exceptions/app_exceptions.dart';
import '../../localization/string_hardcoded.dart';
import '../common_widgets/alert_dialogs.dart';

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      if (error == LocationPermissionDeniedForeverException().code) {
        showAlertDialog(
          context: context,
          title: 'Location Permission Denied'.hardcoded,
          content: LocationPermissionDeniedForeverException().message,
          cancelActionText: 'cancel'.hardcoded,
          defaultActionText: 'Go to Settings'.hardcoded,
          defaultAction: () async {
            context.pop();
            await Geolocator.openAppSettings();
          },
        );
      } else if (error == LocationServicesNotEnabledException().code) {
        showAlertDialog(
          context: context,
          title: 'Location Permission Denied'.hardcoded,
          content: LocationServicesNotEnabledException().message,
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
