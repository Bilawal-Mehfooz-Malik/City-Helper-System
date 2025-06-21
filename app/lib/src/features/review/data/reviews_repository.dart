import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reviews_repository.g.dart';

class ReviewsRepository {
  Future<List<Review>> fetchReviewsList(EntityId entityId) {
    throw UnimplementedError();
  }

  Stream<List<Review>> watchReviewsList(EntityId entityId) {
    throw UnimplementedError();
  }

  Future<Review?> fetchReview(EntityId entityId, UserId userId) {
    throw UnimplementedError();
  }

  Stream<Review?> watchReview(EntityId entityId, UserId userId) {
    throw UnimplementedError();
  }

  Future<void> addReview(EntityId entityId, Review review) {
    throw UnimplementedError();
  }

  Future<void> updateReview(EntityId entityId, Review review) {
    throw UnimplementedError();
  }

  Future<void> deleteReview(EntityId entityId, UserId userId) {
    throw UnimplementedError();
  }
}

@riverpod
ReviewsRepository reviewsRepository(Ref ref) {
  return ReviewsRepository();
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
