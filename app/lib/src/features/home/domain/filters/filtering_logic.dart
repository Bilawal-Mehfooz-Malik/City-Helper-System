import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home/domain/categories/food.dart';
import 'package:app/src/features/home/domain/categories/residence.dart';
import 'package:app/src/features/home/domain/filters/entity_filter.dart';
import 'package:app/src/features/home/domain/filters/food_filter.dart';
import 'package:app/src/features/home/domain/filters/residence_filter.dart';
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

  sortedList.sort((a, b) {
    int comparison = 0;
    if (filter is ResidenceFilter && filter.priceSort != SortOrder.none) {
      comparison = _compareByPrice(a, b, filter.priceSort);
      if (comparison != 0) return comparison;
    }
    if (filter.ratingSort != SortOrder.none) {
      comparison = _compareByRating(a, b, filter.ratingSort);
      if (comparison != 0) return comparison;
    }
    return 0;
  });

  return sortedList;
}

// --- Private Filter Check Helpers ---

bool _checkOpen(Entity entity, EntityFilter filter) {
  if (filter.isOpen) {
    return entity.isEntityOpen();
  }
  return true;
}

bool _matchFurnished(Entity entity, EntityFilter filter) {
  if (entity is Residence && filter is ResidenceFilter && filter.isFurnished) {
    return entity.checkFurnished(true);
  }
  return true;
}

bool _matchGender(Entity entity, EntityFilter filter) {
  if (entity is Residence && filter is ResidenceFilter) {
    return entity.matchGenderPref(filter.genderPref);
  } else if (entity is Food && filter is FoodFilter) {
    return entity.matchGenderPref(filter.genderPref);
  }
  return true;
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
