class PlaceSuggestion {
  final String id;
  final String name;
  final String? streetAddress;

  PlaceSuggestion({
    required this.id,
    required this.name,
    this.streetAddress,
  });

  factory PlaceSuggestion.fromJson(Map<String, Object?> json) {
    final placePrediction =
        json['placePrediction'] as Map<String, Object?>? ?? {};
    final structuredFormat =
        placePrediction['structuredFormat'] as Map<String, Object?>? ?? {};

    return PlaceSuggestion(
      id: placePrediction['placeId'] as String? ?? '', // camelCase 'placeId'
      name: (structuredFormat['mainText'] as Map<String, Object?>?)?['text']
              as String? ??
          '',
      streetAddress: (structuredFormat['secondaryText']
          as Map<String, Object?>?)?['text'] as String?,
    );
  }
}

class PlaceDetails {
  final double latitude;
  final double longitude;
  final String? streetAddress;

  PlaceDetails({
    required this.latitude,
    required this.longitude,
    this.streetAddress,
  });

  factory PlaceDetails.fromJson(Map<String, Object?> json) {
    final location = json['location'] as Map<String, Object?>? ?? {};
    final address = json['formattedAddress'] as String?;

    return PlaceDetails(
      latitude:
          location['latitude'] as double? ?? (throw MissingLatitudeException()),
      longitude: location['longitude'] as double? ??
          (throw MissingLongitudeException()),
      streetAddress: address,
    );
  }
}

class MissingLatitudeException implements Exception {
  final String message = 'Missing latitude';
}

class MissingLongitudeException implements Exception {
  final String message = 'Missing longitude';
}
