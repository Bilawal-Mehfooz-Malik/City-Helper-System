import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/home_detail/data/fake/test_reviews.dart';
import 'package:app/src/features/review/data/reviews_repository.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:app/src/features/review/domain/review_sorting.dart';

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

  @override
  Future<List<Review>> fetchPaginatedReviews({
    required EntityId entityId,
    required ReviewSortOption sortOption,
    int? ratingFilter,
    required int limit,
    List<dynamic>? cursor,
  }) async {
    await delay(addDelay);

    // 1. Filter by entityId and rating
    var filteredReviews = _reviews.value.where((r) {
      if (r.entityId != entityId) return false;
      if (ratingFilter == null) return true;

      final rating = r.rating;
      switch (ratingFilter) {
        case 1:
          return rating < 2.0;
        case 2:
          return rating >= 2.0 && rating < 3.0;
        case 3:
          return rating >= 3.0 && rating < 4.0;
        case 4:
          return rating >= 4.0 && rating < 5.0;
        case 5:
          return rating >= 5.0;
        default:
          return true;
      }
    }).toList();

    // 2. Sort the filtered list
    switch (sortOption) {
      case ReviewSortOption.latest:
        filteredReviews.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
        break;
      case ReviewSortOption.oldest:
        filteredReviews.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));
        break;
      case ReviewSortOption.highest:
        filteredReviews.sort((a, b) {
          final ratingCompare = b.rating.compareTo(a.rating);
          if (ratingCompare != 0) return ratingCompare;
          return b.updatedAt.compareTo(a.updatedAt);
        });
        break;
      case ReviewSortOption.lowest:
        filteredReviews.sort((a, b) {
          final ratingCompare = a.rating.compareTo(b.rating);
          if (ratingCompare != 0) return ratingCompare;
          return b.updatedAt.compareTo(a.updatedAt);
        });
        break;
    }

    // 3. Apply cursor for pagination
    int startIndex = 0;
    if (cursor != null) {
      int foundIndex = -1;
      switch (sortOption) {
        case ReviewSortOption.latest:
        case ReviewSortOption.oldest:
          foundIndex = filteredReviews.indexWhere((r) => r.updatedAt == cursor[0] && r.userId == cursor[1]);
          break;
        case ReviewSortOption.highest:
        case ReviewSortOption.lowest:
          foundIndex = filteredReviews.indexWhere((r) => r.rating == cursor[0] && r.updatedAt == cursor[1] && r.userId == cursor[2]);
          break;
      }
      if (foundIndex != -1) {
        startIndex = foundIndex + 1;
      }
    }

    // 4. Return the final paginated list
    if (startIndex >= filteredReviews.length) {
      return [];
    }
    final endIndex = startIndex + limit > filteredReviews.length
            ? filteredReviews.length
            : startIndex + limit;
    final result = filteredReviews.sublist(startIndex, endIndex);
    return result;
  }

  @override
  Future<List<Review>> fetchReviewsPreviewList(EntityId entityId) async {
    await delay(addDelay);
    final allReviews = _reviews.value.where((r) => r.entityId == entityId).toList();
    allReviews.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return allReviews.take(5).toList();
  }
}
