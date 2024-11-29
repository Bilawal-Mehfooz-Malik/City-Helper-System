import 'dart:convert';

class Location {
  final String country;
  final String province;
  final String city;

  Location({required this.country, required this.province, required this.city});

  @override
  String toString() =>
      'Location(country: $country, province: $province, city: $city)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Location &&
        other.country == country &&
        other.province == province &&
        other.city == city;
  }

  @override
  int get hashCode => country.hashCode ^ province.hashCode ^ city.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'province': province,
      'city': city,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      country: map['country'] ?? '',
      province: map['province'] ?? '',
      city: map['city'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));
}
