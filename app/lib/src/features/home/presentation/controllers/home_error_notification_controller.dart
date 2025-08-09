import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_error_notification_controller.g.dart';

@riverpod
class HomeErrorNotificationController
    extends _$HomeErrorNotificationController {
  @override
  Object? build() {
    // No error by default
    return null;
  }

  /// Stores the error object.
  void addError(Object error) {
    state = error;
  }

  /// Hides the error banner by clearing the error.
  void clearError() {
    state = null;
  }
}
