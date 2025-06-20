import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'entity_search_query_notifier.g.dart';

@riverpod
class EntitySearchQueryNotifier extends _$EntitySearchQueryNotifier {
  final _searchQueryController = StreamController<String>();
  late final StreamSubscription<String> _subscription;

  @override
  String build() {
    _subscription = _searchQueryController.stream
        .debounceTime(const Duration(milliseconds: 200))
        .listen(_updateState);
    ref.onDispose(() {
      _searchQueryController.close();
      _subscription.cancel();
    });
    return '';
  }

  void _updateState(String query) {
    state = query;
  }

  void setQuery(String query) {
    _searchQueryController.sink.add(query);
  }

  void clear() {
    state = '';
  }
}
