import 'dart:convert';

import 'geo_location.dart';

class AppUser {
  final GeoLocation userLocation;
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

  Map<String, dynamic> toMap() {
    return {
      'userLocation': userLocation.toMap(),
      'lastUpdated': lastUpdated.millisecondsSinceEpoch,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      userLocation: GeoLocation.fromMap(map['userLocation']),
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(map['lastUpdated']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));
}
