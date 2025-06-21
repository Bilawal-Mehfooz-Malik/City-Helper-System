import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/current_date_provider.dart';
import 'package:app/src/core/utils/notifier_mounted.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/review/review.dart';
import 'package:app/src/features/review/reviews_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leave_review_controller.g.dart';

@riverpod
class LeaveReviewController extends _$LeaveReviewController
    with NotifierMounted {
  @override
  FutureOr<void> build() {
    ref.onDispose(setUnmounted);
  }

  Future<void> submitReview({
    required EntityId entityId,
    required CategoryId categoryId,
    required double rating,
    required String comment,
    Review? previousReview,
    required void Function() onSuccess,
  }) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) return;

    if (previousReview == null ||
        rating != previousReview.rating ||
        comment != previousReview.comment) {
      final currentDateBuilder = ref.read(currentDateProvider);
      final reviewsService = ref.read(reviewsServiceProvider);
      final review = Review(
        userId: user.uid,
        entityId: entityId,
        rating: rating,
        comment: comment,
        updatedAt: currentDateBuilder,
      );
      state = const AsyncLoading();
      final result = await AsyncValue.guard(
        () => reviewsService.submitReview(
          entityId: entityId,
          review: review,
          categoryId: categoryId,
        ),
      );
      if (mounted) {
        state = result;
        if (state.hasError == false) {
          onSuccess();
        }
      }
    } else {
      onSuccess();
    }
  }
}
