import 'package:app/src/core/exceptions/app_exceptions.dart';

class NoCategoryFoundException extends AppException {
  NoCategoryFoundException() : super('no-category-found', 'No category found');
}
