class RatingBreakdown {
  final int starRating; // Star value from 1 to 5
  final int ratingCount; // Number of times this star rating was given

  RatingBreakdown({required this.starRating, required this.ratingCount});

  /// Calculates the percentage this star rating represents out of a total
  double percentageOf(int totalRatings) {
    if (totalRatings == 0) return 0.0;
    return (ratingCount / totalRatings) * 100;
  }
}
