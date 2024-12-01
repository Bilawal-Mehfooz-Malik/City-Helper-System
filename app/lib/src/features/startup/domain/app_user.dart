import 'package:latlong2/latlong.dart';

class AppUser {
  final LatLng userLocation;
  final DateTime lastUpdated;

  AppUser({required this.userLocation, required this.lastUpdated});

  @override
  String toString() =>
      'AppUser(userLocation: $userLocation, lastUpdated: $lastUpdated)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.userLocation == userLocation &&
        other.lastUpdated == lastUpdated;
  }

  @override
  int get hashCode => userLocation.hashCode ^ lastUpdated.hashCode;
}
