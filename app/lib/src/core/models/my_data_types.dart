// * These identifier are important concept and can have its own type.
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

typedef UserId = String;
typedef EntityId = String;
typedef CategoryId = int;
typedef SubCategoryId = int;
typedef CarouselAdId = String;

typedef GoogleMapBuilder = Widget Function(LatLng latLng);

enum SortOrder { none, lowToHigh, highToLow }

enum GenderPreference { any, maleOnly, femaleOnly, familyFriendly }

enum EntityStatus { open, closed, defaultStatus }

extension IterableExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (var element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
