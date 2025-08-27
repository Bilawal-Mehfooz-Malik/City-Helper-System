import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/home_exceptions.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/review/data/reviews_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entity_detail_service.g.dart';

class EntityDetailsService {
  const EntityDetailsService(this.ref);
  final Ref ref;

  Future<EntityDetail?> fetchEntityDetails(
    CategoryId categoryId,
    EntityId entityId,
  ) async {
    return switch (categoryId) {
      1 =>
        ref
            .read(residenceDetailsRepositoryProvider)
            .fetchResidenceDetails(entityId),
      2 => ref.read(foodDetailsRepositoryProvider).fetchFoodDetails(entityId),
      _ => throw InvalidCategoryException(),
    };
  }
}

@riverpod
EntityDetailsService entityDetailsService(Ref ref) {
  return EntityDetailsService(ref);
}

@riverpod
Future<EntityDetail?> fetchEntityDetails(
  Ref ref,
  CategoryId categoryId,
  EntityId entityId,
) async {
  final entityDetailsRepo = ref.watch(entityDetailsServiceProvider);
  return entityDetailsRepo.fetchEntityDetails(categoryId, entityId);
}

/// Combines entity detail and reviews into one fetch
@riverpod
Future<(EntityDetail?, List<Review>, bool reviewsLoadFailed)>
fetchEntityWithReviews(Ref ref, (CategoryId, EntityId) args) async {
  final (categoryId, entityId) = args;

  // Fetch entity details (critical)
  final entityFuture = ref.watch(
    fetchEntityDetailsProvider(categoryId, entityId).future,
  );
  final entity =
      await entityFuture; // If this fails, it will throw and propagate

  // Fetch reviews (non-critical)
  List<Review> reviews = [];
  bool reviewsLoadFailed = false;
  try {
    final reviewsFuture = ref.watch(fetchReviewsListProvider(entityId).future);
    reviews = await reviewsFuture;
  } catch (e, s) {
    AppLogger.logError('Failed to fetch reviews', error: e, stackTrace: s);
    reviewsLoadFailed = true;
    reviews = []; // Ensure reviews is empty on failure
  }

  print('Fetched entity and reviews: $entity, ${reviews.length} reviews');
  return (entity, reviews, reviewsLoadFailed);
}
