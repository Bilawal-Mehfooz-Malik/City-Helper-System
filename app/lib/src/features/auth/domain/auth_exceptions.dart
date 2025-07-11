import 'package:app/src/core/exceptions/app_exceptions.dart';

class VerificationIdMissingException extends AppException {
  VerificationIdMissingException()
    : super(
        'verification-id-missing',
        'Verification ID is missing. Please try again.',
      );
}

class UserNotAuthenticatedException extends AppException {
  UserNotAuthenticatedException()
    : super(
        'user-not-authenticated',
        'User is not authenticated. Please log in again.',
      );
}

class UserCreationException extends AppException {
  UserCreationException()
    : super(
        'user-creation-failed',
        'Failed to create user. Please try again later.',
      );
}

class UserProfileImageUpdateException extends AppException {
  UserProfileImageUpdateException()
    : super(
        'user-profile-image-update-failed',
        'Failed to update user profile image. Please try again later.',
      );
}

class UserProfileImageDeleteException extends AppException {
  UserProfileImageDeleteException()
    : super(
        'user-profile-image-delete-failed',
        'Failed to delete user profile image. Please try again later.',
      );
}

class ShopImageUploadException extends AppException {
  ShopImageUploadException()
    : super(
        'shop-image-upload-failed',
        'Failed to upload shop image. Please try again later.',
      );
}

class ShopImageDeleteException extends AppException {
  ShopImageDeleteException()
    : super(
        'shop-image-delete-failed',
        'Failed to delete shop image. Please try again later.',
      );
}
