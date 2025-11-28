import 'dart:typed_data';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AuthServiceBase {
  Future<String> uploadUserProfileImage(Uint8List imageBytes, UserId userId);

  Future<void> createUserProfile({
    required String name,
    Uint8List? profileImageBytes,
    LatLng? location,
  });

  Future<void> updateUserProfile({
    String? name,
    Uint8List? profileImageBytes,
    LatLng? location,
    bool removeProfileImage,
  });

  Future<void> deleteAccount();
}
