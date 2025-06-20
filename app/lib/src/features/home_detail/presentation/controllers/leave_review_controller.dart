// import 'package:app/src/core/models/my_data_types.dart';
// import 'package:app/src/core/utils/current_date_provider.dart';
// import 'package:app/src/core/utils/notifier_mounted.dart';
// import 'package:app/src/features/home_detail/application/reviews_service.dart';
// import 'package:app/src/features/home_detail/domain/review.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'leave_review_controller.g.dart';

// @riverpod
// class LeaveReviewController extends _$LeaveReviewController
//     with NotifierMounted {
//   @override
//   FutureOr<void> build() {
//     ref.onDispose(setUnmounted);
//     // nothing to do
//   }

//   Future<void> submitReview({
//     Review? previousReview,
//     required EntityId entityId,
//     required double rating,
//     required String comment,
//     required void Function() onSuccess,
//   }) async {
//     // * only submit if the rating is new or it has changed
//     if (previousReview == null ||
//         rating != previousReview.rating ||
//         comment != previousReview.comment) {
//       final currentDateBuilder = ref.read(currentDateProvider);
//       final reviewsService = ref.read(reviewsServiceProvider);
//       final review = Review(
//         rating: rating,
//         comment: comment,
//         userId: userId,
//         entityId: entityId,
//         updatedAt: currentDateBuilder,
//       );
//       state = const AsyncLoading();
//       final newState = await AsyncValue.guard(
//         () => reviewsService.submitReview(productId: productId, review: review),
//       );
//       if (mounted) {
//         // * only set the state if the controller hasn't been disposed
//         state = newState;
//         if (state.hasError == false) {
//           onSuccess();
//         }
//       }
//     } else {
//       onSuccess();
//     }
//   }
// }
