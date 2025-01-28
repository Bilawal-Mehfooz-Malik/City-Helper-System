import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

class AppLogger {
  /// Prints error information in a structured and readable format
  ///
  /// [message] - A descriptive error message
  /// [error] - The error object
  /// [stackTrace] - The stack trace associated with the error
  static void logError(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    bool printToConsole = true,
  }) {
    final errorMessage = '''
╔══════════════════════════════════════════
║ ERROR: $message
╠══════════════════════════════════════════
${error != null ? '║ Error Details: $error' : ''}
${stackTrace != null ? '╠══════════════════════════════════════════\n║ STACK TRACE:\n$stackTrace' : ''}
╚══════════════════════════════════════════''';

    // Use developer.log for more detailed logging
    developer.log(
      errorMessage,
      name: 'AppLogger',
      error: error,
      stackTrace: stackTrace,
    );

    // Optional console print (useful for development)
    if (printToConsole && kDebugMode) {
      debugPrint(errorMessage);
    }
  }

  /// Convenience method for quick error logging
  static void log(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    logError(
      message.toString(),
      error: error,
      stackTrace: stackTrace,
    );
  }
}
