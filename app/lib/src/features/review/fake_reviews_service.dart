import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/home/data/fake/fake_food_repository.dart';
import 'package:app/src/features/home/data/fake/fake_residence_repository.dart';
import 'package:app/src/features/home_detail/domain/rating_breakdown.dart';
import 'package:app/src/features/review/review.dart';
import 'package:app/src/features/review/reviews_repository.dart';
import 'package:app/src/features/review/reviews_service.dart';
import 'package:app/src/localization/string_hardcoded.dart';

class FakeReviewsService implements ReviewsService {
  const FakeReviewsService({
    required this.fakeResidenceRepository,
    required this.fakeFoodRepository,
    required this.authRepository,
    required this.reviewsRepository,
  });

  final FakeResidenceRepository fakeResidenceRepository;
  final FakeFoodRepository fakeFoodRepository;
  final AuthRepository authRepository;
  final ReviewsRepository reviewsRepository;

  @override
  Future<void> submitReview({
    required EntityId entityId,
    required Review review,
    required CategoryId categoryId,
  }) async {
    final user = authRepository.currentUser;
    assert(user != null);
    if (user == null) {
      throw StateError('User must be logged in to submit a review.'.hardcoded);
    }

    // Save review
    await reviewsRepository.addReview(entityId, review);

    // Recalculate and update entity rating
    await _updateEntityRating(entityId, categoryId);
  }

  Future<void> _updateEntityRating(
    EntityId entityId,
    CategoryId categoryId,
  ) async {
    final reviews = await reviewsRepository.fetchReviewsList(entityId);
    final avgRating = _calculateAverage(reviews);
    final ratingBreakdown = _calculateBreakdown(reviews);

    if (categoryId == 1) {
      final entity = await fakeResidenceRepository.fetchResidence(
        categoryId,
        entityId,
      );
      if (entity == null) throw StateError('Residence not found.'.hardcoded);
      final updated = entity.copyWith(
        avgRating: avgRating,
        totalReviews: reviews.length,
        ratingBreakdown: ratingBreakdown,
      );
      await fakeResidenceRepository.setResidence(updated);
    } else if (categoryId == 2) {
      final entity = await fakeFoodRepository.fetchFood(categoryId, entityId);
      if (entity == null) throw StateError('Food not found.');
      final updated = entity.copyWith(
        avgRating: avgRating,
        totalReviews: reviews.length,
        ratingBreakdown: ratingBreakdown,
      );
      await fakeFoodRepository.setFood(updated);
    } else {
      throw UnsupportedError('Unknown category: $categoryId');
    }
  }

  double _calculateAverage(List<Review> reviews) {
    if (reviews.isEmpty) return 0;
    return reviews.map((r) => r.rating).reduce((a, b) => a + b) /
        reviews.length;
  }

  List<RatingBreakdown> _calculateBreakdown(List<Review> reviews) {
    final List<RatingBreakdown> breakdown = [];
    for (int i = 5; i >= 1; i--) {
      final count = reviews.where((r) => r.rating.round() == i).length;
      breakdown.add(RatingBreakdown(starRating: i, ratingCount: count));
    }
    return breakdown;
  }
}
