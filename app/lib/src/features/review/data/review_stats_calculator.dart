import 'package:app/src/features/home_detail/domain/rating_breakdown.dart';
import 'package:app/src/features/review/domain/review.dart';

/// Calculates review statistics (average rating, total reviews, and rating breakdown)
/// for a given list of reviews.
({double avgRating, int totalReviews, List<RatingBreakdown> ratingBreakdown})
calculateReviewStats(List<Review> reviews) {
  if (reviews.isEmpty) {
    return (avgRating: 0.0, totalReviews: 0, ratingBreakdown: []);
  }

  double totalRatingSum = 0;
  final Map<int, int> breakdownMap = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};

  for (final review in reviews) {
    totalRatingSum += review.rating;
    final roundedRating = review.rating.round();
    if (roundedRating >= 1 && roundedRating <= 5) {
      breakdownMap[roundedRating] = (breakdownMap[roundedRating] ?? 0) + 1;
    }
  }

  final avgRating = totalRatingSum / reviews.length;
  final totalReviews = reviews.length;

  final ratingBreakdown =
      breakdownMap.entries
          .map((entry) => RatingBreakdown(stars: entry.key, count: entry.value))
          .toList()
        ..sort(
          (a, b) => b.stars.compareTo(a.stars),
        ); // Sort by stars descending

  return (
    avgRating: avgRating,
    totalReviews: totalReviews,
    ratingBreakdown: ratingBreakdown,
  );
}
