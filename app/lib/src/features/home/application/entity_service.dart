import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home/domain/home_exceptions.dart';
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
      switch (categoryId) {
        case 1:
          return ref
              .read(residenceRepositoryProvider)
              .watchPopularResidencesListBySubCategoryId(
                categoryId,
                subcategoryId,
              );
        case 2:
          return ref
              .read(foodRepositoryProvider)
              .watchPopularFoodsListSubCategoryId(categoryId, subcategoryId);
        default:
          throw InvalidCategoryException();
      }
    } else {
      switch (categoryId) {
        case 1:
          return ref
              .read(residenceRepositoryProvider)
              .watchPopularResidencesList(categoryId);
        case 2:
          return ref
              .read(foodRepositoryProvider)
              .watchPopularFoodsList(categoryId);
        default:
          throw InvalidCategoryException();
      }
    }
  }

  Stream<List<Entity>> watchEntitiesList(
    CategoryId categoryId,
    SubCategoryId? subcategoryId,
  ) {
    if (subcategoryId != null) {
      switch (categoryId) {
        case 1:
          return ref
              .read(residenceRepositoryProvider)
              .watchResidencesListBySubCategoryId(categoryId, subcategoryId);
        case 2:
          return ref
              .read(foodRepositoryProvider)
              .watchFoodsListBySubCategoryId(categoryId, subcategoryId);
        default:
          throw InvalidCategoryException();
      }
    } else {
      switch (categoryId) {
        case 1:
          return ref
              .read(residenceRepositoryProvider)
              .watchResidencesList(categoryId);
        case 2:
          return ref.read(foodRepositoryProvider).watchFoodsList(categoryId);
        default:
          throw InvalidCategoryException();
      }
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
  final service = ref.watch(entityServiceProvider);
  return service.watchPopularEntitiesList(categoryId, subcategoryId);
}

@riverpod
Stream<List<Entity>> watchEntities(
  Ref ref,
  CategoryId categoryId,
  SubCategoryId? subcategoryId,
) {
  final service = ref.watch(entityServiceProvider);
  return service.watchEntitiesList(categoryId, subcategoryId);
}
