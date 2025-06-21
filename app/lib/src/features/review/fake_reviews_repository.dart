import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home_detail/data/fake/test_reviews.dart';
import 'package:app/src/features/review/reviews_repository.dart';
import 'package:app/src/features/review/review.dart';

class FakeReviewsRepository implements ReviewsRepository {
  FakeReviewsRepository({this.addDelay = true});
  final bool addDelay;

  // In-memory store of all reviews
  final _reviews = InMemoryStore<List<Review>>(testReviews);

  @override
  Future<void> addReview(EntityId entityId, Review review) async {
    await delay(addDelay);
    final current = [..._reviews.value];
    current.removeWhere(
      (r) => r.entityId == entityId && r.userId == review.userId,
    );
    current.add(review);
    _reviews.value = current;
  }

  @override
  Future<void> deleteReview(EntityId entityId, UserId userId) async {
    await delay(addDelay);
    final current = [..._reviews.value];
    current.removeWhere((r) => r.entityId == entityId && r.userId == userId);
    _reviews.value = current;
  }

  @override
  Future<Review?> fetchReview(EntityId entityId, UserId userId) async {
    await delay(addDelay);
    return _reviews.value.firstWhereOrNull(
      (r) => r.entityId == entityId && r.userId == userId,
    );
  }

  @override
  Future<List<Review>> fetchReviewsList(EntityId entityId) async {
    await delay(addDelay);
    return _reviews.value.where((r) => r.entityId == entityId).toList();
  }

  @override
  Future<void> updateReview(EntityId entityId, Review review) async {
    await delay(addDelay);
    final current = [..._reviews.value];
    final index = current.indexWhere(
      (r) => r.entityId == entityId && r.userId == review.userId,
    );
    if (index != -1) {
      current[index] = review;
      _reviews.value = current;
    }
  }

  @override
  Stream<Review?> watchReview(EntityId entityId, UserId userId) async* {
    await delay(addDelay);
    yield* _reviews.stream.map(
      (list) => list.firstWhereOrNull(
        (r) => r.entityId == entityId && r.userId == userId,
      ),
    );
  }

  @override
  Stream<List<Review>> watchReviewsList(EntityId entityId) async* {
    await delay(addDelay);
    yield* _reviews.stream.map(
      (list) => list.where((r) => r.entityId == entityId).toList(),
    );
  }
}
