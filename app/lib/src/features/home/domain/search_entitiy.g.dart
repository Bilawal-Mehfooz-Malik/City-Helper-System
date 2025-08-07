// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_entitiy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchEntity _$SearchEntityFromJson(Map<String, dynamic> json) =>
    _SearchEntity(
      id: json['objectID'] as String,
      name: json['name'] as String,
      cityName: json['cityName'] as String,
      sectorName: json['sectorName'] as String,
    );

Map<String, dynamic> _$SearchEntityToJson(_SearchEntity instance) =>
    <String, dynamic>{
      'objectID': instance.id,
      'name': instance.name,
      'cityName': instance.cityName,
      'sectorName': instance.sectorName,
    };
