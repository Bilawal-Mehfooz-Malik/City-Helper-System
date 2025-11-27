import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/application/entity_detail_service.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/review/data/reviews_repository.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:app/src/features/review/data/review_stats_calculator.dart';
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

    final stats = calculateReviewStats(reviews);

    // Update entity
    if (categoryId == 1) {
      final residenceRepo = _ref.read(residenceDetailsRepositoryProvider);
      final current = await residenceRepo.fetchResidenceDetails(entityId);
      if (current != null) {
        final updated = current.copyWith(
          avgRating: stats.avgRating,
          totalReviews: stats.totalReviews,
          ratingBreakdown: stats.ratingBreakdown,
        );
        await residenceRepo.setResidenceDetail(updated);
      }
      _ref.invalidate(fetchEntityDetailsProvider(categoryId, entityId));
      _ref.invalidate(reviewsPreviewListProvider(entityId));
      _ref.invalidate(fetchEntityWithReviewsProvider((categoryId, entityId)));
    } else if (categoryId == 2) {
      final foodRepo = _ref.read(foodDetailsRepositoryProvider);
      final current = await foodRepo.fetchFoodDetails(entityId);
      if (current != null) {
        final updated = current.copyWith(
          avgRating: stats.avgRating,
          totalReviews: stats.totalReviews,
          ratingBreakdown: stats.ratingBreakdown,
        );
        await foodRepo.setFoodDetail(updated);
      }
      _ref.invalidate(fetchEntityDetailsProvider(categoryId, entityId));
      _ref.invalidate(reviewsPreviewListProvider(entityId));
      _ref.invalidate(fetchEntityWithReviewsProvider((categoryId, entityId)));
    }
  }
}

@riverpod
ReviewsService reviewsService(Ref ref) {
  return ReviewsService(ref);
}
