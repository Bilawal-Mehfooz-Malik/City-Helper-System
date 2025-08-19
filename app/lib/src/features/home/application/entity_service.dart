import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';
import 'package:app/src/features/home/domain/home_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entity_service.g.dart';

class EntityService {
  const EntityService(this.ref);
  final Ref ref;

  Future<List<Entity>> fetchPopularEntitiesPaginated({
    required CategoryId categoryId,
    required EntityFilter filter,
    SubCategoryId? subcategoryId,
    String? lastEntityId,
    required int limit,
  }) {
    if (subcategoryId != null) {
      return switch (categoryId) {
        1 =>
          ref
              .read(residenceRepositoryProvider)
              .fetchPopularResidencesListBySubCategoryId(
                subcategoryId,
                filter: filter as ResidenceFilter,
                limit: limit,
                lastEntityId: lastEntityId,
              ),
        2 =>
          ref
              .read(foodRepositoryProvider)
              .fetchPopularFoodsListSubCategoryId(
                subcategoryId,
                filter: filter as FoodFilter,
                limit: limit,
                lastEntityId: lastEntityId,
              ),
        _ => throw InvalidCategoryException(),
      };
    } else {
      return switch (categoryId) {
        1 =>
          ref.read(residenceRepositoryProvider).fetchPopularResidencesList(
                filter: filter as ResidenceFilter,
                limit: limit,
                lastEntityId: lastEntityId,
              ),
        2 =>
          ref.read(foodRepositoryProvider).fetchPopularFoodsList(
              filter: filter as FoodFilter,
              limit: limit,
              lastEntityId: lastEntityId),
        _ => throw InvalidCategoryException(),
      };
    }
  }

  Future<List<Entity>> fetchEntitiesPaginated({
    required CategoryId categoryId,
    required EntityFilter filter,
    SubCategoryId? subcategoryId,
    String? lastEntityId,
    required int limit,
  }) {
    if (subcategoryId != null) {
      return switch (categoryId) {
        1 =>
          ref
              .read(residenceRepositoryProvider)
              .fetchResidencesListBySubCategoryId(
                subcategoryId,
                filter: filter as ResidenceFilter,
                limit: limit,
                lastEntityId: lastEntityId,
              ),
        2 =>
          ref.read(foodRepositoryProvider).fetchFoodsListSubCategoryId(
                subcategoryId,
                filter: filter as FoodFilter,
                limit: limit,
                lastEntityId: lastEntityId,
              ),
        _ => throw InvalidCategoryException(),
      };
    } else {
      return switch (categoryId) {
        1 =>
          ref.read(residenceRepositoryProvider).fetchResidencesList(
              filter: filter as ResidenceFilter,
              limit: limit,
              lastEntityId: lastEntityId),
        2 =>
          ref.read(foodRepositoryProvider).fetchFoodsList(
              filter: filter as FoodFilter,
              limit: limit,
              lastEntityId: lastEntityId),
        _ => throw InvalidCategoryException(),
      };
    }
  }
}

@riverpod
EntityService entityService(Ref ref) {
  return EntityService(ref);
}