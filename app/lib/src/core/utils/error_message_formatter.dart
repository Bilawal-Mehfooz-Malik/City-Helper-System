import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/src/core/exceptions/app_exceptions.dart';
import 'package:app/src/features/home/domain/home_exceptions.dart'
    hide NetworkException;

/// A helper function to map an error to a user-friendly message.
String formatErrorMessage(Object error) {
  final appException = _getAppException(error);
  return appException.message;
}

/// Maps a generic [Object] error to a specific [AppException].
AppException _getAppException(Object error) {
  if (error is FirebaseException) {
    switch (error.code) {
      case 'unavailable':
      case 'deadline-exceeded':
        return NetworkException();
      case 'permission-denied':
        return PermissionDeniedException();
      default:
        return UnexpectedErrorException();
    }
  } else if (error is AppException) {
    // If the error is already one of our custom exceptions, just return it.
    return error;
  } else {
    // For any other type of error, return a generic exception.
    return UnexpectedErrorException();
  }
}
