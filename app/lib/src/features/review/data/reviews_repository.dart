import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:app/src/features/review/domain/review_sorting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reviews_repository.g.dart';

class ReviewsRepository {
  ReviewsRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String get reviewsKey => 'reviews';

  String _docId(EntityId entityId, UserId userId) => '${entityId}_$userId';

  CollectionReference<Map<String, dynamic>> get _reviewsRef =>
      _firestore.collection(reviewsKey);

  Future<List<Review>> fetchReviewsList(EntityId entityId) async {
    final query = await _reviewsRef
        .where('entityId', isEqualTo: entityId)
        .orderBy('updatedAt', descending: true)
        .get();
    return query.docs.map((doc) => Review.fromJson(doc.data())).toList();
  }

  Stream<List<Review>> watchReviewsList(EntityId entityId) {
    return _reviewsRef
        .where('entityId', isEqualTo: entityId)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Review.fromJson(doc.data())).toList(),
        );
  }

  Future<Review?> fetchReview(EntityId entityId, UserId userId) async {
    final doc = await _reviewsRef.doc(_docId(entityId, userId)).get();
    if (doc.exists) {
      return Review.fromJson(doc.data()!);
    } else {
      return null;
    }
  }

  Stream<Review?> watchReview(EntityId entityId, UserId userId) {
    return _reviewsRef.doc(_docId(entityId, userId)).snapshots().map((doc) {
      if (doc.exists) {
        return Review.fromJson(doc.data()!);
      } else {
        return null;
      }
    });
  }

  Future<void> addReview(EntityId entityId, Review review) {
    return _reviewsRef
        .doc(_docId(entityId, review.userId))
        .set(review.toJson());
  }

  Future<void> updateReview(EntityId entityId, Review review) {
    return _reviewsRef
        .doc(_docId(entityId, review.userId))
        .update(review.toJson());
  }

  Future<void> deleteReview(EntityId entityId, UserId userId) {
    return _reviewsRef.doc(_docId(entityId, userId)).delete();
  }

  Future<List<Review>> fetchPaginatedReviews({
    required EntityId entityId,
    required ReviewSortOption sortOption,
    int? ratingFilter,
    required int limit,
    List<dynamic>? cursor,
  }) async {
    Query query = _reviewsRef.where('entityId', isEqualTo: entityId);

    // Apply rating filter
    if (ratingFilter != null) {
      final double lowerBound = ratingFilter.toDouble();
      if (ratingFilter == 5) {
        query = query.where('rating', isGreaterThanOrEqualTo: lowerBound);
      } else if (ratingFilter == 1) {
        query = query.where('rating', isLessThan: 2.0);
      } else {
        query = query
            .where('rating', isGreaterThanOrEqualTo: lowerBound)
            .where('rating', isLessThan: lowerBound + 1.0);
      }
    }

    // Apply sorting
    switch (sortOption) {
      case ReviewSortOption.latest:
        query = query.orderBy('updatedAt', descending: true);
        break;
      case ReviewSortOption.oldest:
        query = query.orderBy('updatedAt', descending: false);
        break;
      case ReviewSortOption.highest:
        query = query.orderBy('rating', descending: true);
        query = query.orderBy('updatedAt', descending: true);
        break;
      case ReviewSortOption.lowest:
        query = query.orderBy('rating', descending: false);
        query = query.orderBy('updatedAt', descending: true);
        break;
    }

    if (cursor != null) {
      query = query.startAfter(cursor);
    }

    final snapshot = await query.limit(limit).get();

    return snapshot.docs
        .map((doc) => Review.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<Review>> fetchReviewsPreviewList(EntityId entityId) async {
    final query = await _reviewsRef
        .where('entityId', isEqualTo: entityId)
        .orderBy('updatedAt', descending: true)
        .limit(5)
        .get();
    return query.docs.map((doc) => Review.fromJson(doc.data())).toList();
  }
}

@riverpod
ReviewsRepository reviewsRepository(Ref ref) {
  return ReviewsRepository(FirebaseFirestore.instance);
}

@riverpod
Future<List<Review>> fetchReviewsList(Ref ref, EntityId entityId) {
  final repository = ref.watch(reviewsRepositoryProvider);
  return repository.fetchReviewsList(entityId);
}

@riverpod
Stream<List<Review>> watchReviewsList(Ref ref, EntityId entityId) {
  final repository = ref.watch(reviewsRepositoryProvider);
  return repository.watchReviewsList(entityId);
}

@riverpod
Future<Review?> userReviewFuture(Ref ref, EntityId entityId) {
  final user = ref.watch(authStateChangesProvider).value;
  if (user != null) {
    return ref.watch(reviewsRepositoryProvider).fetchReview(entityId, user.uid);
  } else {
    return Future.value(null);
  }
}

@riverpod
Future<List<Review>> reviewsPreviewList(Ref ref, EntityId entityId) {
  final repository = ref.watch(reviewsRepositoryProvider);
  return repository.fetchReviewsPreviewList(entityId);
}
