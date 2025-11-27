import 'package:app/src/core/exceptions/app_exceptions.dart';
import 'package:app/src/core/exceptions/error_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class AsyncErrorLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    final container = context.container;
    final errorLogger = container.read(errorLoggerProvider);

    final error = _findError(newValue);
    if (error != null) {
      if (error.error is AppException) {
        errorLogger.logAppException(error.error as AppException);
      } else {
        errorLogger.logError(error.error, error.stackTrace);
      }
    }
  }

  AsyncError<dynamic>? _findError(Object? value) {
    if (value is AsyncError) {
      return value;
    } else {
      return null;
    }
  }
}
