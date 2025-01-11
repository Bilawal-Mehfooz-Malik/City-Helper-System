import 'package:app/src/core/exceptions/app_exceptions.dart';

class LocationServicesDisabledException extends AppException {
  LocationServicesDisabledException()
      : super(
          'services-disabled',
          'Location services are disabled. Please enable them in your device settings.',
        );
}

class LocationPermissionDeniedException extends AppException {
  LocationPermissionDeniedException()
      : super(
          'permission-denied',
          'Location permission denied. Please allow access to continue.',
        );
}

class LocationUnavailableException extends AppException {
  LocationUnavailableException()
      : super(
          'location-unavailable',
          'User location is unavailable. Please select your location before saving.',
        );
}

class LocationPermissionDeniedForeverException extends AppException {
  LocationPermissionDeniedForeverException()
      : super(
          'permission-denied-forever',
          'Location access is required. Please enable location permission in settings to proceed.',
        );
}

class LocationFetchFailedException extends AppException {
  LocationFetchFailedException()
      : super(
          'fetch-failed',
          'Unable to retrieve location. Please try again later.',
        );
}
