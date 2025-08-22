import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

class LatLngJsonConverter implements JsonConverter<LatLng, Object> {
  const LatLngJsonConverter();

  @override
  LatLng fromJson(Object json) {
    final latLng = LatLng.fromJson(json);
    if (latLng == null) {
      throw ArgumentError.value(
        json,
        'json',
        'LatLng.fromJson returned null for valid map input',
      );
    }
    return latLng;
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
        OpeningHours.fromJson(value as Map<String, dynamic>),
      );
    });
  }

  @override
  Map<String, dynamic> toJson(Map<DayOfWeek, OpeningHours> object) {
    return object.map((key, value) => MapEntry(key.name, value.toJson()));
  }
}
