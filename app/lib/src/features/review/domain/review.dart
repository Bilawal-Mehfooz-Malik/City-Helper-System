import 'package:app/src/core/models/my_data_types.dart';

class Review {
  final UserId userId;
  final EntityId entityId;
  final double rating;
  final String comment;
  final DateTime updatedAt;

  Review({
    required this.userId,
    required this.entityId,
    required this.rating,
    required this.comment,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      userId: json['userId'] as String,
      entityId: json['entityId'] as String,
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'entityId': entityId,
      'rating': rating,
      'comment': comment,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Review copyWith({
    UserId? userId,
    EntityId? entityId,
    double? rating,
    String? comment,
    DateTime? updatedAt,
  }) {
    return Review(
      userId: userId ?? this.userId,
      entityId: entityId ?? this.entityId,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Review &&
            userId == other.userId &&
            entityId == other.entityId &&
            rating == other.rating &&
            comment == other.comment &&
            updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(userId, entityId, rating, comment, updatedAt);
  }

  @override
  String toString() {
    return 'Review(userId: $userId, entityId: $entityId, rating: $rating, comment: $comment, updatedAt: $updatedAt)';
  }
}
