// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpeningHours _$OpeningHoursFromJson(Map<String, dynamic> json) =>
    _OpeningHours(
      isDayOff: json['isDayOff'] as bool? ?? false,
      is24Hours: json['is24Hours'] as bool? ?? false,
      slots:
          (json['slots'] as List<dynamic>?)
              ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$OpeningHoursToJson(_OpeningHours instance) =>
    <String, dynamic>{
      'isDayOff': instance.isDayOff,
      'is24Hours': instance.is24Hours,
      'slots': instance.slots?.map((e) => e.toJson()).toList(),
    };
