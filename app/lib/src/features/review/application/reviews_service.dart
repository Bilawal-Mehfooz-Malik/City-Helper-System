import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/home_detail/domain/rating_breakdown.dart';
import 'package:app/src/features/review/data/reviews_repository.dart';
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
    final repo = _ref.read(reviewsRepositoryProvider);
    final existing = await repo.fetchReview(entityId, review.userId);

    // Add or update the review
    if (existing == null) {
      await repo.addReview(entityId, review);
    } else {
      await repo.updateReview(entityId, review);
    }

    // Fetch all reviews for this entity
    final reviews = await repo.fetchReviewsList(entityId);

    final totalReviews = reviews.length;
    final avgRating =
        reviews.fold<double>(0, (sum, r) => sum + r.rating) / totalReviews;

    // Build breakdown: Map<int, int> => {5: 10, 4: 2, ...}
    final Map<int, int> breakdownMap = {};
    for (final r in reviews) {
      final rounded = r.rating.round();
      breakdownMap[rounded] = (breakdownMap[rounded] ?? 0) + 1;
    }
    final breakdown = breakdownMap.entries
        .map((e) => RatingBreakdown(stars: e.key, count: e.value))
        .toList();

    // Update entity
    if (categoryId == 1) {
      final residenceRepo = _ref.read(residenceDetailsRepositoryProvider);
      final current = await residenceRepo.fetchResidenceDetails(entityId);
      if (current != null) {
        final updated = current.copyWith(
          avgRating: avgRating,
          totalReviews: totalReviews,
          ratingBreakdown: breakdown,
        );
        await residenceRepo.setResidenceDetail(updated);
      }
    } else if (categoryId == 2) {
      final foodRepo = _ref.read(foodDetailsRepositoryProvider);
      final current = await foodRepo.fetchFoodDetails(entityId);
      if (current != null) {
        final updated = current.copyWith(
          avgRating: avgRating,
          totalReviews: totalReviews,
          ratingBreakdown: breakdown,
        );
        await foodRepo.setFoodDetail(updated);
      }
    }
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
