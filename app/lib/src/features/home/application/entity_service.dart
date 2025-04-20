import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home/domain/categories/food.dart';
import 'package:app/src/features/home/domain/categories/residence.dart';
import 'package:app/src/features/home/domain/filters/residence_filter.dart';
import 'package:app/src/features/home/domain/home_exceptions.dart';
import 'package:app/src/features/home/presentation/controllers/filter_controller.dart';
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
        1 => ref
            .read(residenceRepositoryProvider)
            .watchPopularResidencesListBySubCategoryId(
              categoryId,
              subcategoryId,
            ),
        2 => ref
            .read(foodRepositoryProvider)
            .watchPopularFoodsListSubCategoryId(categoryId, subcategoryId),
        _ => throw InvalidCategoryException(),
      };
    } else {
      return switch (categoryId) {
        1 => ref
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
        1 => ref
            .read(residenceRepositoryProvider)
            .watchResidencesListBySubCategoryId(categoryId, subcategoryId),
        2 => ref
            .read(foodRepositoryProvider)
            .watchFoodsListBySubCategoryId(categoryId, subcategoryId),
        _ => throw InvalidCategoryException(),
      };
    } else {
      return switch (categoryId) {
        1 => ref
            .read(residenceRepositoryProvider)
            .watchResidencesList(categoryId),
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
  final service = ref.watch(entityServiceProvider);
  return service.watchPopularEntitiesList(categoryId, subcategoryId);
}

@riverpod
Stream<List<Entity>> watchEntities(
  Ref ref,
  CategoryId categoryId,
  SubCategoryId? subcategoryId,
) {
  // Watch the unfiltered stream from the service
  final entitiesAsyncValue = ref
      .watch(entityServiceProvider)
      .watchEntitiesList(categoryId, subcategoryId);

  // Watch the filter state
  final filter = ref.watch(filterControllerProvider(category: categoryId));

  // Combine the stream data and the filter to produce the filtered/sorted list
  return entitiesAsyncValue.map((entities) {
    // Apply filtering logic
    Iterable<Entity> filteredEntities = entities.where((entity) {
      // General Entity filtering (e.g., isOpen, genderPref)
      bool matchesFilter = true;

      // Checking if an Entity is open based on openingHours and current time
      if (filter.isOpen) {
        matchesFilter = matchesFilter && entity.isEntityOpen();
      }

      if (filter.genderPref != GenderPreference.any) {
        if (entity is Residence) {
          matchesFilter =
              matchesFilter && entity.genderPref == filter.genderPref;
        } else if (entity is Food) {
          matchesFilter =
              matchesFilter && entity.genderPref == filter.genderPref;
        }
      }

      // Applying type-specific filtering (e.g., isFurnished for Residence)
      if (entity is Residence && filter is ResidenceFilter) {
        if (filter.isFurnished) {
          matchesFilter = matchesFilter && entity.isFurnished;
        }
      }

      return matchesFilter;
    });

    // Apply sorting logic
    List<Entity> sortedEntities = filteredEntities.toList();
    sortedEntities.sort((a, b) {
      int comparison = 0;

      // price sort
      if (filter is ResidenceFilter) {
        if (filter.priceSort != SortOrder.none) {
          if (a is Residence && b is Residence) {
            comparison =
                filter.priceSort == SortOrder.lowToHigh
                    ? a.price.compareTo(b.price)
                    : b.price.compareTo(a.price);
            if (comparison != 0) return comparison;
          }
        }
      }

      // rating sort
      if (filter.ratingSort != SortOrder.none) {
        comparison =
            filter.ratingSort == SortOrder.highToLow
                ? b.avgRating.compareTo(a.avgRating)
                : a.avgRating.compareTo(b.avgRating);
        if (comparison != 0) return comparison;
      }

      return 0;
    });

    return sortedEntities;
  });
}
