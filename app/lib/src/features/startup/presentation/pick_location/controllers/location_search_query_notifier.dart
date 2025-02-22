import 'dart:async';

import 'package:app/src/features/startup/data/real/location_search_repository.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'location_search_query_notifier.g.dart';

/// A simple notifier class to keep track of the search query
@riverpod
class LocationSearchQueryNotifier extends _$LocationSearchQueryNotifier {
  /// Used to debounce the input queries
  final _searchQueryController = StreamController<String>();
  late final StreamSubscription<String> _subscription;

  @override
  String build() {
    // debounce the inputs
    _subscription = _searchQueryController.stream
        .debounceTime(const Duration(milliseconds: 100))
        .listen(_updateState);
    // don't forget to close the StreamController on dispose
    ref.onDispose(() {
      _searchQueryController.close();
      _subscription.cancel();
    });
    // by default, return an empty query
    return '';
  }

  void _updateState(String query) {
    // only update the state once the query has been debounced
    // log('state = $query');
    state = query;
  }

  void setQuery(String query) {
    // rather than setting the state directly, add the query to the sink so it
    // can be debounced
    // log('query = $query');
    _searchQueryController.sink.add(query);
  }
}

/// A provider that returns the search results for the current search query
@riverpod
Future<List<PlaceSuggestion>?> locationSearchResults(Ref ref) {
  final searchQuery = ref.watch(locationSearchQueryNotifierProvider);
  return ref.watch(LocationListSearchProvider(searchQuery).future);
}
