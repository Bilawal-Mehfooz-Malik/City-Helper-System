import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home/domain/categories/food.dart';
import 'package:app/src/features/home/domain/categories/residence.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';
import 'package:app/src/core/models/my_data_types.dart';

/// Filters a list of entities based on the provided filter criteria.
///
/// Returns a new list containing only the matching entities.
List<Entity> filterEntities(List<Entity> entities, EntityFilter filter) {
  return entities.where((entity) {
    return _checkOpen(entity, filter) &&
        _matchGender(entity, filter) &&
        _matchFurnished(entity, filter);
  }).toList();
}

/// Sorts a list of entities based on the provided filter criteria.
/// Returns a new sorted list.
List<Entity> sortEntities(List<Entity> entities, EntityFilter filter) {
  final sortedList = List<Entity>.from(entities);

  // Determine the primary sort order based on the filter type
  final priceSortOrder = filter.when(
    residence: (_, _, _, priceSort, _) => priceSort,
    food: (_, _, _) => SortOrder.none, // No price sort for food
    basic: (_, _) => SortOrder.none, // No price sort for basic
  );

  // The rating sort order can be accessed via the shared getter
  final ratingSortOrder = filter.getRatingSort;

  sortedList.sort((a, b) {
    int comparison = 0;

    // First, sort by price if applicable
    if (priceSortOrder != SortOrder.none) {
      comparison = _compareByPrice(a, b, priceSortOrder);
      if (comparison != 0) return comparison;
    }

    // Then, sort by rating if applicable
    if (ratingSortOrder != SortOrder.none) {
      comparison = _compareByRating(a, b, ratingSortOrder);
      if (comparison != 0) return comparison;
    }

    return 0;
  });

  return sortedList;
}

// --- Private Filter Check Helpers ---

bool _checkOpen(Entity entity, EntityFilter filter) {
  if (filter.getIsOpen) {
    return entity.isEntityOpen();
  }
  return true;
}

bool _matchFurnished(Entity entity, EntityFilter filter) {
  return filter.when(
    residence: (_, _, isFurnished, _, _) {
      if (entity is Residence && isFurnished) {
        return entity.checkFurnished(true);
      }
      return true;
    },
    food: (_, _, _) => true, // No furnished filter for food
    basic: (_, _) => true, // No furnished filter for basic
  );
}

bool _matchGender(Entity entity, EntityFilter filter) {
  return filter.when(
    residence: (_, _, _, _, genderPref) {
      if (entity is Residence) {
        return entity.matchGenderPref(genderPref);
      }
      return true;
    },
    food: (_, _, genderPref) {
      if (entity is Food) {
        return entity.matchGenderPref(genderPref);
      }
      return true;
    },
    basic: (_, _) => true, // No gender filter for basic
  );
}

// --- Private Sorting Helpers ---

int _compareByPrice(Entity a, Entity b, SortOrder order) {
  if (a is Residence && b is Residence) {
    return order == SortOrder.lowToHigh
        ? a.price.compareTo(b.price)
        : b.price.compareTo(a.price);
  }
  return 0;
}

int _compareByRating(Entity a, Entity b, SortOrder order) {
  return order == SortOrder.highToLow
      ? b.avgRating.compareTo(a.avgRating)
      : a.avgRating.compareTo(b.avgRating);
}
