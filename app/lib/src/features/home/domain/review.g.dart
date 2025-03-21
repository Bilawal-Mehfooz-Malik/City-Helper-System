// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      userId: json['userId'] as String,
      id: json['id'] as String,
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'rating': instance.rating,
      'comment': instance.comment,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
