import 'package:app/src/core/models/my_data_types.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppUser {
  final UserId uid;
  final String phoneNumber;
  final String name;
  final String? profileImageUrl;
  final LatLng? lastLocation;

  AppUser({
    required this.uid,
    required this.phoneNumber,
    required this.name,
    this.profileImageUrl,
    this.lastLocation,
  });

  AppUser copyWith({
    UserId? uid,
    String? phoneNumber,
    String? name,
    String? profileImageUrl,
    LatLng? lastLocation,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      lastLocation: lastLocation ?? this.lastLocation,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'phoneNumber': phoneNumber,
      'name': name,
      'profileImageUrl': profileImageUrl,
      'lastLocation': lastLocation?.toJson(),
    };
  }

  static AppUser fromJson(Map<String, Object?> json) {
    return AppUser(
      uid: json['uid'] as UserId,
      phoneNumber: json['phoneNumber'] as String,
      name: json['name'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      lastLocation: json['lastLocation'] != null
          ? LatLng.fromJson(json['lastLocation'])
          : null,
    );
  }

  @override
  String toString() {
    return 'AppUser(uid: $uid, phoneNumber: $phoneNumber, name: $name, profileImageUrl: $profileImageUrl, lastLocation: $lastLocation)';
  }

  @override
  bool operator ==(Object other) {
    return other is AppUser &&
        other.uid == uid &&
        other.phoneNumber == phoneNumber &&
        other.name == name &&
        other.profileImageUrl == profileImageUrl &&
        other.lastLocation == lastLocation;
  }

  @override
  int get hashCode =>
      Object.hash(uid, phoneNumber, name, profileImageUrl, lastLocation);
}
