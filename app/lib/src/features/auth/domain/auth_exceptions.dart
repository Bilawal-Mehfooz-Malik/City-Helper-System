import 'package:app/src/core/exceptions/app_exceptions.dart';

class VerificationIdMissingException extends AppException {
  VerificationIdMissingException()
    : super(
        'verification-id-missing',
        'Verification ID is missing. Please try again.',
      );
}
