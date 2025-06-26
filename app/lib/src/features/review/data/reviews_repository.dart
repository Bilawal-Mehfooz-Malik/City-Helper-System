import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
