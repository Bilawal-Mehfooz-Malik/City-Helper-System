import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/home_exceptions.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
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
            .fetchResidenceDetails(categoryId, entityId),
      2 =>
        ref
            .read(foodDetailsRepositoryProvider)
            .fetchFoodDetails(categoryId, entityId),
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
            .watchResidenceDetails(categoryId, entityId),
      2 =>
        ref
            .read(foodDetailsRepositoryProvider)
            .watchFoodDetails(categoryId, entityId),
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
