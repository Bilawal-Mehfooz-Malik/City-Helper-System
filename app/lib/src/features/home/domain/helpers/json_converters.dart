import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

class LatLngJsonConverter implements JsonConverter<LatLng, Object> {
  const LatLngJsonConverter();

  @override
  LatLng fromJson(Object json) {
    final latLng = LatLng.fromJson(json);

    if (latLng != null) {
      return latLng;
    }
    throw ArgumentError.value(
      json,
      'json',
      'Cannot be converted to a LatLng from type ${json.runtimeType}',
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
