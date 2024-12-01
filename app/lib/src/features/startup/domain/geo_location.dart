// import 'dart:convert';

// class GeoLocation {
//   final double latitude;
//   final double longitude;

//   GeoLocation({required this.latitude, required this.longitude});

//   @override
//   String toString() =>
//       'GeoLocation(latitude: $latitude, longitude: $longitude)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is GeoLocation &&
//         other.latitude == latitude &&
//         other.longitude == longitude;
//   }

//   @override
//   int get hashCode => latitude.hashCode ^ longitude.hashCode;

//   Map<String, dynamic> toMap() {
//     return {
//       'latitude': latitude,
//       'longitude': longitude,
//     };
//   }

//   factory GeoLocation.fromMap(Map<String, dynamic> map) {
//     return GeoLocation(
//       latitude: map['latitude']?.toDouble() ?? 0.0,
//       longitude: map['longitude']?.toDouble() ?? 0.0,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory GeoLocation.fromJson(String source) =>
//       GeoLocation.fromMap(json.decode(source));
// }
