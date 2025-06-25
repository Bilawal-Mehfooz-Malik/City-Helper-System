class RatingBreakdown {
  final int stars;
  final int count;

  RatingBreakdown({required this.stars, required this.count});

  double percentageOf(int totalRatings) {
    if (totalRatings == 0) return 0.0;
    return (count / totalRatings) * 100;
  }

  Map<String, Object> toJson() => {'stars': stars, 'count': count};

  factory RatingBreakdown.fromJson(Map<String, Object> json) =>
      RatingBreakdown(stars: json['stars'] as int, count: json['count'] as int);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingBreakdown && stars == other.stars && count == other.count;

  @override
  int get hashCode => stars.hashCode ^ count.hashCode;
}
