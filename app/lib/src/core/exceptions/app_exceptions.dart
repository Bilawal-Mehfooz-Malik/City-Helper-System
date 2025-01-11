/// Base class for all all client-side errors that can be generated by the app
class AppException implements Exception {
  AppException(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => message;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppException &&
        other.code == code &&
        other.message == message;
  }

  @override
  int get hashCode => Object.hash(code, message);
}

/// [InternetConnectionExceptions]
class NoInternetConnectionException extends AppException {
  NoInternetConnectionException()
      : super(
          'no-internet-connection',
          'Unable to connect to the internet. Please check your connection and try again.',
        );
}

/// [TimedOutException]
class TimedOutException extends AppException {
  TimedOutException()
      : super(
          'time-out',
          'Request timed out. Please try again.',
        );
}
