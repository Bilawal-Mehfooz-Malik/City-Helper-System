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

// TODO: rename defaultStatus to dynamic or basedOnHours
enum OperationalStatus { open, close, defaultStatus }

enum ApprovalStatus { blocked, pending, approved }

enum EntityType { residence, food }
