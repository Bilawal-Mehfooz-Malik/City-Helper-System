import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/application/filtering_logic.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';
import 'package:app/src/features/home/domain/home_exceptions.dart';
import 'package:app/src/features/home/presentation/controllers/filter_controller.dart';
import 'package:app/src/features/home/presentation/controllers/list_type_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entity_service.g.dart';

class EntityService {
  const EntityService(this.ref);
  final Ref ref;

  Stream<List<Entity>> watchPopularEntitiesList(
    CategoryId categoryId,
    SubCategoryId? subcategoryId,
  ) {
    if (subcategoryId != null) {
      return switch (categoryId) {
        1 =>
          ref
              .read(residenceRepositoryProvider)
              .watchPopularResidencesListBySubCategoryId(subcategoryId),
        2 =>
          ref
              .read(foodRepositoryProvider)
              .watchPopularFoodsListSubCategoryId(subcategoryId),
        _ => throw InvalidCategoryException(),
      };
    } else {
      return switch (categoryId) {
        1 => ref.read(residenceRepositoryProvider).watchPopularResidencesList(),
        2 => ref.read(foodRepositoryProvider).watchPopularFoodsList(),
        _ => throw InvalidCategoryException(),
      };
    }
  }

  Stream<List<Entity>> watchEntitiesList(
    CategoryId categoryId,
    SubCategoryId? subcategoryId,
  ) {
    if (subcategoryId != null) {
      return switch (categoryId) {
        1 =>
          ref
              .read(residenceRepositoryProvider)
              .watchResidencesListBySubCategoryId(subcategoryId),
        2 =>
          ref
              .read(foodRepositoryProvider)
              .watchFoodsListBySubCategoryId(subcategoryId),
        _ => throw InvalidCategoryException(),
      };
    } else {
      return switch (categoryId) {
        1 => ref.read(residenceRepositoryProvider).watchResidencesList(),
        2 => ref.read(foodRepositoryProvider).watchFoodsList(),
        _ => throw InvalidCategoryException(),
      };
    }
  }
}

@riverpod
EntityService entityService(Ref ref) {
  return EntityService(ref);
}

@riverpod
Stream<List<Entity>> watchPopularEntities(
  Ref ref,
  CategoryId categoryId,
  SubCategoryId? subcategoryId,
) {
  // 1. Watch the unfiltered stream of popular entities
  final popularEntitiesStream = ref
      .watch(entityServiceProvider)
      .watchPopularEntitiesList(categoryId, subcategoryId);

  final listType = ref.watch(listTypeControllerProvider);

  if (listType != HomeListType.popular) {
    return popularEntitiesStream;
  } else {
    // 2. Watch the filter state and apply transformations
    final filter = ref.watch(filterControllerProvider(categoryId: categoryId));
    return _applyFilteringAndSorting(popularEntitiesStream, filter);
  }
}

@riverpod
Stream<List<Entity>> watchEntities(
  Ref ref,
  CategoryId categoryId,
  SubCategoryId? subcategoryId,
) {
  // 1. Watch the unfiltered stream of entities
  final entitiesStream = ref
      .watch(entityServiceProvider)
      .watchEntitiesList(categoryId, subcategoryId);
  final listType = ref.watch(listTypeControllerProvider);

  if (listType != HomeListType.all) {
    return entitiesStream;
  } else {
    // 2. Watch the filter state and apply transformations
    final filter = ref.watch(filterControllerProvider(categoryId: categoryId));
    return _applyFilteringAndSorting(entitiesStream, filter);
  }
}

// Helper method to apply filtering and sorting
Stream<List<Entity>> _applyFilteringAndSorting(
  Stream<List<Entity>> entitiesStream,
  EntityFilter filter,
) {
  return entitiesStream.map((entities) {
    final filteredEntities = filterEntities(entities, filter);
    final sortedEntities = sortEntities(filteredEntities, filter);
    return sortedEntities;
  });
}
