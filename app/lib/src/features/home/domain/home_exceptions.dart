import 'package:app/src/core/exceptions/app_exceptions.dart';

class InvalidCategoryException extends AppException {
  InvalidCategoryException()
    : super(
        'invalid-category',
        'The requested data is not found. please try again later.',
      );
}
