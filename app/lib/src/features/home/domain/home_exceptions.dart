import 'package:app/src/core/exceptions/app_exceptions.dart';

/// Exception for an invalid category.
class InvalidCategoryException extends AppException {
  InvalidCategoryException() 
      : super(
          'invalid-category',
          'The requested data is not found. Please try again later.',
        );
}

/// Exception for network-related errors.
class NetworkException extends AppException {
  NetworkException() 
      : super(
          'network-error',
          'Network Error: Please check your internet connection.',
        );
}

/// Exception for permission denied errors.
class PermissionDeniedException extends AppException {
  PermissionDeniedException() 
      : super(
          'permission-denied',
          'You don\'t have permission to view this.',
        );
}

/// Exception for any other unexpected errors.
class UnexpectedErrorException extends AppException {
  UnexpectedErrorException() 
      : super(
          'unexpected-error',
          'An unexpected error occurred. Please try again.',
        );
}
