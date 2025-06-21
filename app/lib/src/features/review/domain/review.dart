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
}
