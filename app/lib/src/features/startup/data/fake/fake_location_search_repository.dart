import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/startup/data/real/location_search_repository.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';

class FakeLocationSearchRepository implements LocationSearchRepository {
  final _suggestionsStore = InMemoryStore<List<PlaceSuggestion>>([
    PlaceSuggestion(
      id: 'test1',
      name: 'Test Place 1',
      streetAddress: '123 Test Street',
    ),
    PlaceSuggestion(
      id: 'test2',
      name: 'Test Place 2',
      streetAddress: '456 Example Road',
    ),
  ]);

  final _placeDetailsStore = InMemoryStore<Map<String, PlaceDetails>>({
    'test1': PlaceDetails(
      latitude: 33.1401,
      longitude: 73.7490,
      streetAddress: '123 Test Street',
    ),
    'test2': PlaceDetails(
      latitude: 34.0522,
      longitude: 118.2437,
      streetAddress: '456 Example Road',
    ),
  });

  @override
  Future<List<PlaceSuggestion>> fetchSuggestions(String query) async {
    return _suggestionsStore.value;
  }

  @override
  Future<Place> fetchPlaceDetails(PlaceSuggestion suggestion) async {
    final details = _placeDetailsStore.value[suggestion.id];
    if (details == null) {
      throw Exception('Details not found for ${suggestion.id}');
    }

    return Place(
      id: suggestion.id,
      name: suggestion.name,
      streetAddress: details.streetAddress,
      geoLocation: GeoLocation(
        latitude: details.latitude,
        longitude: details.longitude,
      ),
    );
  }

  void dispose() {
    _suggestionsStore.close();
    _placeDetailsStore.close();
  }
}
