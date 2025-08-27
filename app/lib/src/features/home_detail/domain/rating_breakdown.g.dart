// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_breakdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RatingBreakdown _$RatingBreakdownFromJson(Map<String, dynamic> json) =>
    _RatingBreakdown(
      stars: (json['stars'] as num).toInt(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$RatingBreakdownToJson(_RatingBreakdown instance) =>
    <String, dynamic>{'stars': instance.stars, 'count': instance.count};
