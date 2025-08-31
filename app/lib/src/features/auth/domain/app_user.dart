import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/json_converters.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

const _latLngJsonConverter = LatLngJsonConverter();

@freezed
abstract class AppUser with _$AppUser {
  factory AppUser({
    required UserId uid,
    required String phoneNumber,
    required String name,
    String? profileImageUrl,
    @_latLngJsonConverter LatLng? lastLocation,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);
}

extension AppUserExtension on AppUser {
  bool get isProfileComplete => name.isNotEmpty;
}
