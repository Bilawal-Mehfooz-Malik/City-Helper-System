import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

class LatLngJsonConverter implements JsonConverter<LatLng, Object> {
  const LatLngJsonConverter();

  @override
  LatLng fromJson(Object json) {
    if (json is List<dynamic> && json.length == 2) {
      final latitude = json[0] as double;
      final longitude = json[1] as double;
      return LatLng(latitude, longitude);
    }
    throw ArgumentError.value(
      json,
      'json',
      'Invalid format for LatLng. Expected a List of two doubles.',
    );
  }

  @override
  Object toJson(LatLng latLng) {
    return latLng.toJson();
  }
}

class TimestampJsonConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampJsonConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime object) {
    return Timestamp.fromDate(object);
  }
}

class OpeningHoursConverter
    implements
        JsonConverter<Map<DayOfWeek, OpeningHours>, Map<String, dynamic>> {
  const OpeningHoursConverter();

  @override
  Map<DayOfWeek, OpeningHours> fromJson(Map<String, dynamic> json) {
    return json.map((key, value) {
      final day = DayOfWeek.values.byName(key);
      return MapEntry(
        day,
        value == null
            ? const OpeningHours(isDayOff: true)
            : OpeningHours.fromJson(value as Map<String, dynamic>),
      );
    });
  }

  @override
  Map<String, dynamic> toJson(Map<DayOfWeek, OpeningHours> object) {
    return object.map((key, value) => MapEntry(key.name, value.toJson()));
  }
}
