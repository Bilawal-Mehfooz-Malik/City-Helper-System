import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reviews_service.g.dart';

class ReviewsService {
  ReviewsService(this._ref);
  final Ref _ref;

  Future<void> submitReview({
    required EntityId entityId,
    required Review review,
    required CategoryId categoryId,
  }) async {
    throw UnimplementedError();
  }
}

@riverpod
ReviewsService reviewsService(Ref ref) {
  return ReviewsService(ref);
}

// /// Check if a entity was previously reviewed by the user
// @riverpod
// Future<Review?> userReviewFuture(Ref ref, EntityId entityId) {
//   throw UnimplementedError();
// }

// /// Check if a entity was previously reviewed by the user
// @riverpod
// Stream<Review?> userReviewStream(Ref ref, EntityId entityId) {
//   final user = ref.watch(authStateChangesProvider).value;
//   if (user != null) {
//     return ref.watch(reviewsRepositoryProvider).watchReview(entityId, user.uid);
//   } else {
//     return Stream.value(null);
//   }
// }
