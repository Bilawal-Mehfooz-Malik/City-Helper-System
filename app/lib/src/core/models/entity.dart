import 'package:latlong2/latlong.dart';
import 'location.dart';
import 'my_data_types.dart';

abstract class Entity {
  final UserId userId;
  final EntityId id; // Unique identifier for the entity
  final String name;
  final String description;
  final String coverImageUrl;
  final List<String> imagesUrls;
  final String videosUrl;
  final Location location;
  final LatLng geoLocation;
  final String address;
  final double avgRating;
  final int reviewsCount;
  final bool isPopular; // for showing it in popular section
  final DateTime updatedAt; // change to timestamp
  final String? phoneNum;
  final String? waNum;
  final String? webUrl;
  final String? instaUrl;
  final String? fbUrl;

  Entity({
    required this.userId,
    required this.id,
    required this.name,
    required this.description,
    required this.coverImageUrl,
    required this.imagesUrls,
    required this.videosUrl,
    required this.location,
    required this.geoLocation,
    required this.address,
    required this.avgRating,
    required this.reviewsCount,
    required this.isPopular,
    required this.updatedAt,
    this.phoneNum,
    this.waNum,
    this.webUrl,
    this.instaUrl,
    this.fbUrl,
  });
}
