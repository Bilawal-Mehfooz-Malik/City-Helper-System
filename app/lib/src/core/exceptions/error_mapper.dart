import 'package:app/src/core/exceptions/app_exceptions.dart';
import 'package:app/src/core/exceptions/ui_error.dart';
import 'package:app/src/features/pick_location/domain/location_exceptions.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:geolocator/geolocator.dart';

UIError mapExceptionToUI(Object error) {
  if (error is LocationPermissionDeniedForeverException) {
    return UIError(
      title: 'Location Permission Denied'.hardcoded,
      message: error.message,
      cancel: kIsWeb ? null : 'Cancel'.hardcoded,
      confirm: kIsWeb ? 'OK'.hardcoded : 'Open Settings'.hardcoded,
      onConfirm: kIsWeb ? null : () => Geolocator.openAppSettings(),
    );
  }

  if (error is LocationServicesDisabledException) {
    return UIError(
      title: 'Location Services Disabled'.hardcoded,
      message: error.message,
      cancel: kIsWeb ? null : 'Cancel'.hardcoded,
      confirm: kIsWeb ? 'OK'.hardcoded : 'Open Settings'.hardcoded,
      onConfirm: kIsWeb ? null : () => Geolocator.openLocationSettings(),
    );
  }

  if (error is LocationPermissionDeniedException) {
    return UIError(
      title: 'Location Permission Denied'.hardcoded,
      message: error.message,
      cancel: kIsWeb ? null : 'Cancel'.hardcoded,
      confirm: kIsWeb ? 'OK'.hardcoded : 'Open Settings'.hardcoded,
      onConfirm: kIsWeb ? null : () => Geolocator.openAppSettings(),
    );
  }

  if (error is AppException) {
    return UIError(
      title: 'Error'.hardcoded,
      message: error.message,
      confirm: 'OK'.hardcoded,
    );
  }

  // fallback
  return UIError(
    title: 'Unexpected Error'.hardcoded,
    message: error.toString(),
    confirm: 'OK'.hardcoded,
  );
}
