import 'dart:developer' as developer;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class AppLogger {
  static const String _tag = "[AppLogger]";

  /// Logs an **error message** with an optional stack trace
  static void logError(String message,
      {Object? error, StackTrace? stackTrace}) {
    final errorMessage = _formatMessage(
      title: "❌ ERROR",
      message: message,
      error: error,
      stackTrace: stackTrace,
      color: _ConsoleColors.red,
    );
    developer.log(errorMessage,
        name: "ERROR", error: error, stackTrace: stackTrace);

    // Also report to Crashlytics
    if (error != null) {
      FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
        reason: message,
        fatal: false, // These are handled, so not necessarily fatal
      );
    }
  }

  /// Logs a **warning message**
  static void logWarning(String message) {
    final warningMessage = _formatMessage(
      title: "⚠️ WARNING",
      message: message,
      color: _ConsoleColors.yellow,
    );
    developer.log(warningMessage, name: "WARNING");
  }

  /// Logs an **info message**
  static void logInfo(String message) {
    final infoMessage = _formatMessage(
      title: "ℹ️ INFO",
      message: message,
      color: _ConsoleColors.blue,
    );
    developer.log(infoMessage, name: "INFO");
  }

  /// Logs a **success message**
  static void logSuccess(String message) {
    final successMessage = _formatMessage(
      title: "✅ SUCCESS",
      message: message,
      color: _ConsoleColors.green,
    );
    developer.log(successMessage, name: "SUCCESS");
  }

  /// ------------------------------------------------------
  /// ---------------[PrivateMethods]-----------------------
  /// ------------------------------------------------------
  /// Formats the message with colors, emojis, and structure
  static String _formatMessage({
    required String title,
    required String message,
    String color = _ConsoleColors.reset,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final buffer = StringBuffer();
    buffer.writeln("$color$title $_tag: $message${_ConsoleColors.reset}");

    if (error != null) {
      buffer.writeln("  🔥 Exception: $error");
    }
    if (stackTrace != null) {
      buffer.writeln("  📌 StackTrace: \n$stackTrace");
    }

    return buffer.toString();
  }
}

/// Console Colors for better visibility in terminal
class _ConsoleColors {
  static const String reset = "\x1B[0m";
  static const String red = "\x1B[31m";
  static const String green = "\x1B[32m";
  static const String yellow = "\x1B[33m";
  static const String blue = "\x1B[34m";
}
