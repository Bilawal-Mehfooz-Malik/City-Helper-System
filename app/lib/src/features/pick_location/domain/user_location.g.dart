// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserLocation _$UserLocationFromJson(Map<String, dynamic> json) =>
    _UserLocation(
      coordinates: Coordinates.fromJson(
        json['coordinates'] as Map<String, dynamic>,
      ),
      countryName: json['countryName'] as String?,
      cityName: json['cityName'] as String?,
    );

Map<String, dynamic> _$UserLocationToJson(_UserLocation instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'countryName': instance.countryName,
      'cityName': instance.cityName,
    };
