import 'package:app/src/features/review/domain/review.dart';

final testReviews = <Review>[
  Review(
    userId: 'user_001',
    entityId: 'res_001',
    rating: 4.5,
    comment: 'Great place! Clean rooms and friendly staff.',
    updatedAt: DateTime.now().subtract(Duration(days: 2)),
  ),
  Review(
    userId: 'user_002',
    entityId: 'res_001',
    rating: 3.8,
    comment: 'Good value for the price. Could improve Wi-Fi.',
    updatedAt: DateTime.now().subtract(Duration(days: 4)),
  ),
  Review(
    userId: 'user_003',
    entityId: 'res_001',
    rating: 4.2,
    comment: 'Very cozy and quiet. I slept well here.',
    updatedAt: DateTime.now().subtract(Duration(days: 1)),
  ),
  Review(
    userId: 'user_004',
    entityId: 'res_001',
    rating: 5.0,
    comment: 'Exceptional experience. Highly recommended!',
    updatedAt: DateTime.now().subtract(Duration(days: 3)),
  ),
  Review(
    userId: 'user_005',
    entityId: 'res_001',
    rating: 3.5,
    comment: 'Decent stay. Room service was a bit slow.',
    updatedAt: DateTime.now().subtract(Duration(days: 5)),
  ),
  Review(
    userId: 'user_006',
    entityId: 'res_002',
    rating: 4.0,
    comment: 'Modern decor and well-maintained facilities.',
    updatedAt: DateTime.now().subtract(Duration(days: 2)),
  ),
  Review(
    userId: 'user_007',
    entityId: 'res_002',
    rating: 3.9,
    comment: 'Comfortable beds but noisy neighborhood.',
    updatedAt: DateTime.now().subtract(Duration(days: 6)),
  ),
  Review(
    userId: 'user_008',
    entityId: 'res_002',
    rating: 4.7,
    comment: 'Great location and excellent hospitality.',
    updatedAt: DateTime.now().subtract(Duration(days: 1)),
  ),
  Review(
    userId: 'user_009',
    entityId: 'res_002',
    rating: 2.8,
    comment: 'Not clean enough. Needs better management.',
    updatedAt: DateTime.now().subtract(Duration(days: 8)),
  ),
  Review(
    userId: 'user_010',
    entityId: 'res_002',
    rating: 4.1,
    comment: 'Good facilities and helpful staff.',
    updatedAt: DateTime.now().subtract(Duration(days: 4)),
  ),
];
