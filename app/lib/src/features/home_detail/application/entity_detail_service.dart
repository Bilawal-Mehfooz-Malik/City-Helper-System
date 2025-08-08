/*
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/home_exceptions.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/review/data/reviews_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/review/domain/review.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

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

  Stream<EntityDetail?> watchEntityDetails(
    CategoryId categoryId,
    EntityId entityId,
  ) {
    return switch (categoryId) {
      1 =>
        ref
            .read(residenceDetailsRepositoryProvider)
            .watchResidenceDetails(entityId),
      2 => ref.read(foodDetailsRepositoryProvider).watchFoodDetails(entityId),
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

@riverpod
Stream<EntityDetail?> watchEntityDetails(
  Ref ref,
  CategoryId categoryId,
  EntityId entityId,
) {
  final entityDetailsRepo = ref.watch(entityDetailsServiceProvider);
  return entityDetailsRepo.watchEntityDetails(categoryId, entityId);
}

/// Combines entity detail and reviews into one fetch
@riverpod
Future<(EntityDetail?, List<Review>)> fetchEntityWithReviews(
  Ref ref,
  (CategoryId, EntityId) args,
) async {
  final (categoryId, entityId) = args;

  final entityFuture = ref.watch(
    fetchEntityDetailsProvider(categoryId, entityId).future,
  );
  final reviewsFuture = ref.watch(fetchReviewsListProvider(entityId).future);

  final results = await Future.wait([entityFuture, reviewsFuture]);

  return (results[0] as EntityDetail?, results[1] as List<Review>);
}

@riverpod
Stream<(EntityDetail?, List<Review>)> watchEntityWithReviews(
  Ref ref,
  (CategoryId, EntityId) args,
) {
  final (categoryId, entityId) = args;

  // Watch both providers – these return AsyncValue<EntityDetail?> and AsyncValue<List<Review>>
  final entityAsyncValue = ref.watch(
    watchEntityDetailsProvider(categoryId, entityId),
  );
  final reviewsAsyncValue = ref.watch(watchReviewsListProvider(entityId));

  // Combine the latest AsyncValues using Rx
  return Rx.combineLatest2(
    Stream.value(entityAsyncValue),
    Stream.value(reviewsAsyncValue),
    (AsyncValue<EntityDetail?> entity, AsyncValue<List<Review>> reviews) {
      if (entity.isLoading || reviews.isLoading) {
        return (null, <Review>[]);
      }
      if (entity.hasError) throw entity.error!;
      if (reviews.hasError) throw reviews.error!;
      return (entity.value, reviews.value ?? []);
    },
  );
}
*/