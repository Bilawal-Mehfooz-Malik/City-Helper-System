import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_error_notification_controller.g.dart';

@riverpod
class HomeErrorNotificationController extends _$HomeErrorNotificationController {
  @override
  bool build() {
    // The banner is not visible by default
    return false;
  }

  /// Shows the error banner.
  void addError() {
    state = true;
  }

  /// Hides the error banner.
  void clearError() {
    state = false;
  }
}
