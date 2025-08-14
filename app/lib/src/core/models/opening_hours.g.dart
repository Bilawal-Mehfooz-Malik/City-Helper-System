// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpeningHours _$OpeningHoursFromJson(Map<String, dynamic> json) =>
    _OpeningHours(
      day: json['day'] as String,
      isOpen: json['isOpen'] as bool? ?? true,
      open: json['open'] as String?,
      close: json['close'] as String?,
    );

Map<String, dynamic> _$OpeningHoursToJson(_OpeningHours instance) =>
    <String, dynamic>{
      'day': instance.day,
      'isOpen': instance.isOpen,
      'open': instance.open,
      'close': instance.close,
    };
