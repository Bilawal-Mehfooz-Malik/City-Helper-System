import 'my_data_types.dart';

// Provide the reviews related to a entity
class Review {
  final UserId userId;
  final EntityId id;
  final double rating;
  final String comment;
  final DateTime timestamp;

  Review({
    required this.userId,
    required this.id,
    required this.rating,
    required this.comment,
    required this.timestamp,
  });
}
