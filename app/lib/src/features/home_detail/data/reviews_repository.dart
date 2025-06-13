import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/domain/review.dart';
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
