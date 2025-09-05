// * These identifier are important concept and can have its own type.
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

typedef UserId = String;
typedef EntityId = String;
typedef CategoryId = int;
typedef SubCategoryId = int;
typedef CarouselAdId = String;
typedef BusinessId = String; // New

typedef GoogleMapBuilder = Widget Function(LatLng latLng);

enum SortOrder { none, lowToHigh, highToLow }

enum GenderPreference { maleOnly, femaleOnly, familyFriendly }

enum OperationalStatus { open, close, defaultStatus }

enum ApprovalStatus { blocked, pending, approved }

enum EntityType { residence, food }

enum DayOfWeek { sunday, monday, tuesday, wednesday, thursday, friday, saturday }

enum ListingType { forRent, forSale }

enum AdLinkType { internalProfile, externalUrl } // New
enum AdApprovalStatus { pending, approved, rejected, paused } // New

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