import 'package:app/src/core/models/place.dart';
import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/core/utils/in_memory_store.dart';
import 'package:app/src/features/startup/data/real/location_search_repository.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';

class FakeLocationSearchRepository implements LocationSearchRepository {
  FakeLocationSearchRepository({int timeOut = 30}) : _timeOut = timeOut {
    _suggestionsStore = InMemoryStore<List<PlaceSuggestion>>(_suggestions);
  }

  final _suggestions = [
    PlaceSuggestion(
      id: 'place1',
      name: 'Islamabad Convention Center',
      streetAddress: 'Convention Center, Islamabad',
    ),
    PlaceSuggestion(
      id: 'place2',
      name: 'Islamabad Club',
      streetAddress: 'Club Road, Islamabad',
    ),
    PlaceSuggestion(
      id: 'place3',
      name: 'Islamabad Marriott Hotel',
      streetAddress: 'Aga Khan Road, Islamabad',
    ),
  ];

  late InMemoryStore<List<PlaceSuggestion>> _suggestionsStore;
  final int _timeOut;

  @override
  Future<List<PlaceSuggestion>> fetchSuggestions(String query) {
    return checkTimeOut(_timeOut, () {
      return _suggestionsStore.stream
          .map((suggestions) => suggestions
              .where((suggestion) =>
                  suggestion.name.toLowerCase().contains(query.toLowerCase()) ||
                  suggestion.streetAddress!
                      .toLowerCase()
                      .contains(query.toLowerCase()))
              .toList())
          .first;
    });
  }

  @override
  Future<Place> fetchPlaceDetails(PlaceSuggestion suggestion) {
    // TODO: implement fetchPlaceDetails
    throw UnimplementedError();
  }
}
