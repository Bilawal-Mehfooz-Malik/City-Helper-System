import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_breakdown.freezed.dart';
part 'rating_breakdown.g.dart';

@freezed
abstract class RatingBreakdown with _$RatingBreakdown {
  const factory RatingBreakdown({required int stars, required int count}) =
      _RatingBreakdown;

  const RatingBreakdown._();

  double percentageOf(int totalRatings) {
    if (totalRatings == 0) return 0.0;
    return (count / totalRatings) * 100;
  }

  factory RatingBreakdown.fromJson(Map<String, Object?> json) =>
      _$RatingBreakdownFromJson(json);
}
