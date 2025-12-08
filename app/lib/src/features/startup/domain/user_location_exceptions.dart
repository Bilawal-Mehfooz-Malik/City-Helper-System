import 'package:app/src/core/exceptions/app_exceptions.dart';

/// Thrown when SharedPreferences data is missing or corrupted.
class FailedtoFetchUserLocationException extends AppException {
  FailedtoFetchUserLocationException([String? reason])
    : super(
        'failed-to-fetch-user-location',
        reason ??
            'Failed to fetch user location due to corrupted or invalid local data.',
      );
}
