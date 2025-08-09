import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/helpers/entity_extensions.dart';

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
      return entity.checkFurnished(isFurnished);
    },
    food: (_, _, _) => true, // No furnished filter for food
    basic: (_, _) => true, // No furnished filter for basic
  );
}

bool _matchGender(Entity entity, EntityFilter filter) {
  return filter.when(
    residence: (_, _, _, _, genderPref) {
      return entity.matchGenderPref(genderPref);
    },
    food: (_, _, genderPref) {
      return entity.matchGenderPref(genderPref);
    },
    basic: (_, _) => true, // No gender filter for basic
  );
}

// --- Private Sorting Helpers ---

int _compareByPrice(Entity a, Entity b, SortOrder order) {
  final priceA = a.mapOrNull(residence: (res) => res.pricing.cost);
  final priceB = b.mapOrNull(residence: (res) => res.pricing.cost);

  if (priceA == null && priceB == null) return 0;
  if (priceA == null) return order == SortOrder.lowToHigh ? 1 : -1;
  if (priceB == null) return order == SortOrder.lowToHigh ? -1 : 1;

  return order == SortOrder.lowToHigh
      ? priceA.compareTo(priceB)
      : priceB.compareTo(priceA);
}

int _compareByRating(Entity a, Entity b, SortOrder order) {
  return order == SortOrder.highToLow
      ? b.avgRating.compareTo(a.avgRating)
      : a.avgRating.compareTo(b.avgRating);
}
