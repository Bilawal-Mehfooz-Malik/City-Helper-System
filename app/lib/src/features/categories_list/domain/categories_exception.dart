import 'package:app/src/core/exceptions/app_exceptions.dart';
import 'package:app/src/localization/string_hardcoded.dart';

class NoCategoryFoundException extends AppException {
  NoCategoryFoundException()
    : super(
        'no-category-found',
        'Category not found. Please try again or select a different one.'
            .hardcoded,
      );
}

class NoEntityFoundException extends AppException {
  NoEntityFoundException()
    : super(
        'no-entity-found',
        'Item not available. It may have been removed or is temporarily unavailable.'
            .hardcoded,
      );
}
