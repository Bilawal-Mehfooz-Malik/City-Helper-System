import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/application/pagination_limit_provider.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/domain/home_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entity_service.g.dart';

class EntityService {
  const EntityService(this.ref);
  final Ref ref;

  Future<List<Entity>> fetchPopularEntitiesPaginated({
    required CategoryId categoryId,
    SubCategoryId? subcategoryId,
    String? lastEntityId,
  }) {
    final limit = ref.read(popularEntitiesLimitProvider);

    if (subcategoryId != null) {
      return switch (categoryId) {
        1 =>
          ref
              .read(residenceRepositoryProvider)
              .fetchPopularResidencesListBySubCategoryId(
                subcategoryId,
                limit: limit,
                lastEntityId: lastEntityId,
              ),
        2 =>
          ref
              .read(foodRepositoryProvider)
              .fetchPopularFoodsListSubCategoryId(
                subcategoryId,
                limit: limit,
                lastEntityId: lastEntityId,
              ),
        _ => throw InvalidCategoryException(),
      };
    } else {
      return switch (categoryId) {
        1 =>
          ref
              .read(residenceRepositoryProvider)
              .fetchPopularResidencesList(
                limit: limit,
                lastEntityId: lastEntityId,
              ),
        2 =>
          ref
              .read(foodRepositoryProvider)
              .fetchPopularFoodsList(limit: limit, lastEntityId: lastEntityId),
        _ => throw InvalidCategoryException(),
      };
    }
  }

  Future<List<Entity>> fetchEntitiesPaginated({
    required CategoryId categoryId,
    SubCategoryId? subcategoryId,
    String? lastEntityId,
  }) {
    final limit = ref.read(popularEntitiesLimitProvider);

    if (subcategoryId != null) {
      return switch (categoryId) {
        1 =>
          ref
              .read(residenceRepositoryProvider)
              .fetchResidencesListBySubCategoryId(
                subcategoryId,
                limit: limit,
                lastEntityId: lastEntityId,
              ),
        2 =>
          ref
              .read(foodRepositoryProvider)
              .fetchFoodsListSubCategoryId(
                subcategoryId,
                limit: limit,
                lastEntityId: lastEntityId,
              ),
        _ => throw InvalidCategoryException(),
      };
    } else {
      return switch (categoryId) {
        1 =>
          ref
              .read(residenceRepositoryProvider)
              .fetchResidencesList(limit: limit, lastEntityId: lastEntityId),
        2 =>
          ref
              .read(foodRepositoryProvider)
              .fetchFoodsList(limit: limit, lastEntityId: lastEntityId),
        _ => throw InvalidCategoryException(),
      };
    }
  }
}

@riverpod
EntityService entityService(Ref ref) {
  return EntityService(ref);
}
