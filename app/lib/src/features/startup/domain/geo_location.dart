class GeoLocation {
  final double latitude;
  final double longitude;

  GeoLocation({required this.latitude, required this.longitude});

  @override
  String toString() =>
      'GeoLocation(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GeoLocation &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}

class Location {
  final String country;
  final String province;
  final String city;

  Location({required this.country, required this.province, required this.city});
}
