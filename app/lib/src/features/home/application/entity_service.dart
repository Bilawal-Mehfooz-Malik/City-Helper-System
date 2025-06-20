import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/filters/filtering_logic.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
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
              .watchPopularResidencesListBySubCategoryId(
                categoryId,
                subcategoryId,
              ),
        2 =>
          ref
              .read(foodRepositoryProvider)
              .watchPopularFoodsListSubCategoryId(categoryId, subcategoryId),
        _ => throw InvalidCategoryException(),
      };
    } else {
      return switch (categoryId) {
        1 =>
          ref
              .read(residenceRepositoryProvider)
              .watchPopularResidencesList(categoryId),
        2 => ref.read(foodRepositoryProvider).watchPopularFoodsList(categoryId),
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
              .watchResidencesListBySubCategoryId(categoryId, subcategoryId),
        2 =>
          ref
              .read(foodRepositoryProvider)
              .watchFoodsListBySubCategoryId(categoryId, subcategoryId),
        _ => throw InvalidCategoryException(),
      };
    } else {
      return switch (categoryId) {
        1 =>
          ref.read(residenceRepositoryProvider).watchResidencesList(categoryId),
        2 => ref.read(foodRepositoryProvider).watchFoodsList(categoryId),
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
    // 2. Watch the filter state
    final filter = ref.watch(filterControllerProvider(categoryId: categoryId));

    // 3. Combine stream and filter, applying filtering and sorting
    return popularEntitiesStream.map((entities) {
      // Step 3a: Filter the entities
      final filteredEntities = filterEntities(entities, filter);

      // Step 3b: Sort the filtered entities
      final sortedEntities = sortEntities(filteredEntities, filter);

      // Step 3c: Return the final list
      return sortedEntities;
    });
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
    // 2. Watch the filter state
    final filter = ref.watch(filterControllerProvider(categoryId: categoryId));

    // 3. Combine stream and filter, applying filtering and sorting
    return entitiesStream.map((entities) {
      // Step 3a: Filter the entities
      final filteredEntities = filterEntities(entities, filter);

      // Step 3b: Sort the filtered entities
      final sortedEntities = sortEntities(filteredEntities, filter);

      // Step 3c: Return the final list
      return sortedEntities;
    });
  }
}
