import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/home/data/fake/fake_food_repository.dart';
import 'package:app/src/features/home/data/fake/fake_residence_repository.dart';
import 'package:app/src/features/home_detail/data/fake/fake_food_details_repository.dart';
import 'package:app/src/features/home_detail/data/fake/fake_residence_details_repository.dart';
import 'package:app/src/features/home_detail/domain/rating_breakdown.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:app/src/features/review/data/reviews_repository.dart';
import 'package:app/src/features/review/application/reviews_service.dart';
import 'package:app/src/localization/string_hardcoded.dart';

class FakeReviewsService implements ReviewsService {
  const FakeReviewsService({
    required this.fakeResidenceRepository,
    required this.fakeFoodRepository,
    required this.authRepository,
    required this.reviewsRepository,
    required this.fakeFoodDetailsRepository,
    required this.fakeResidenceDetailsRepository,
  });

  final FakeResidenceDetailsRepository fakeResidenceDetailsRepository;
  final FakeFoodDetailsRepository fakeFoodDetailsRepository;
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
      final entityDetail = await fakeResidenceDetailsRepository
          .fetchResidenceDetails(categoryId, entityId);
      if (entity == null) throw StateError('Residence not found.'.hardcoded);
      if (entityDetail == null) {
        throw StateError('Residence Detail not found.'.hardcoded);
      }
      final updatedEntity = entity.copyWith(
        avgRating: avgRating,
        totalReviews: reviews.length,
        ratingBreakdown: ratingBreakdown,
      );
      final updatedDetail = entityDetail.copyWith(
        avgRating: avgRating,
        totalReviews: reviews.length,
        ratingBreakdown: ratingBreakdown,
      );

      await fakeResidenceRepository.setResidence(updatedEntity);
      await fakeResidenceDetailsRepository.setResidenceDetail(updatedDetail);
    } else if (categoryId == 2) {
      final entity = await fakeFoodRepository.fetchFood(categoryId, entityId);
      final detail = await fakeFoodDetailsRepository.fetchFoodDetails(
        categoryId,
        entityId,
      );
      if (entity == null) throw StateError('Food not found.');
      if (detail == null) throw StateError('Food Details not found.');
      final updatedEntity = entity.copyWith(
        avgRating: avgRating,
        totalReviews: reviews.length,
        ratingBreakdown: ratingBreakdown,
      );
      final updatedDetail = detail.copyWith(
        avgRating: avgRating,
        totalReviews: reviews.length,
        ratingBreakdown: ratingBreakdown,
      );
      await fakeFoodRepository.setFood(updatedEntity);
      await fakeFoodDetailsRepository.setFoodDetail(updatedDetail);
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
