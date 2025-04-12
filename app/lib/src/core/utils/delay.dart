import 'package:app/src/core/exceptions/app_exceptions.dart';
import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/localization/string_hardcoded.dart';

/// a small helper function to return a Future with a configurable delay
Future<void> delay(bool addDelay, [int milliseconds = 2000]) {
  if (addDelay) {
    return Future.delayed(Duration(milliseconds: milliseconds));
  } else {
    return Future.value();
  }
}

Future<T> checkTimeOut<T>(int timeOut, Future<T> Function() future) {
  return future().timeout(
    Duration(seconds: timeOut),
    onTimeout: () {
      AppLogger.logError(
        'Request timed out after $timeOut seconds'.hardcoded,
        error: TimedOutException(),
        stackTrace: StackTrace.current,
      );
      throw TimedOutException();
    },
  );
}
