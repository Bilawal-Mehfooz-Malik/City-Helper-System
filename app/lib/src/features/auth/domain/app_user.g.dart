// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  uid: json['uid'] as String,
  phoneNumber: json['phoneNumber'] as String,
  name: json['name'] as String,
  profileImageUrl: json['profileImageUrl'] as String?,
  lastLocation: _$JsonConverterFromJson<Object, LatLng>(
    json['lastLocation'],
    _latLngJsonConverter.fromJson,
  ),
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'uid': instance.uid,
  'phoneNumber': instance.phoneNumber,
  'name': instance.name,
  'profileImageUrl': instance.profileImageUrl,
  'lastLocation': _$JsonConverterToJson<Object, LatLng>(
    instance.lastLocation,
    _latLngJsonConverter.toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
