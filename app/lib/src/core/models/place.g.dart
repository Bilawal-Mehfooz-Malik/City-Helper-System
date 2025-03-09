// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Place _$PlaceFromJson(Map<String, dynamic> json) => _Place(
  id: json['id'] as String,
  name: json['name'] as String,
  geoLocation:
      json['geoLocation'] == null
          ? null
          : GeoLocation.fromJson(json['geoLocation'] as Map<String, dynamic>),
  streetAddress: json['streetAddress'] as String?,
);

Map<String, dynamic> _$PlaceToJson(_Place instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'geoLocation': instance.geoLocation,
  'streetAddress': instance.streetAddress,
};
