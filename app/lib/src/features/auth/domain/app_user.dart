import 'package:app/src/core/models/my_data_types.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppUser {
  final UserId uid;
  final String phoneNumber;
  final String? name;
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
}
