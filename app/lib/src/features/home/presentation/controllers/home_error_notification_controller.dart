import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/src/features/home/domain/home_section_identifier.dart';

part 'home_error_notification_controller.g.dart';

@riverpod
class HomeErrorNotificationController extends _$HomeErrorNotificationController {
  @override
  ({Set<HomeSectionIdentifier> failedSections, Object? lastError}) build() {
    return (failedSections: {}, lastError: null);
  }

  void addFailedSection(HomeSectionIdentifier sectionIdentifier, Object error) {
    state = (failedSections: {...state.failedSections, sectionIdentifier}, lastError: error);
  }

  void clearFailedSections() {
    state = (failedSections: {}, lastError: null);
  }
}