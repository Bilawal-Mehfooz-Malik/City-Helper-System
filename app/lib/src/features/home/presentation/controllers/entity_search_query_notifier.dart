import 'dart:async';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/data/real/entity_search_repository.dart';
import 'package:app/src/features/home/domain/home_exceptions.dart';
import 'package:app/src/features/home/domain/search_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'entity_search_query_notifier.g.dart';

/// Debounced query notifier for entity search
@riverpod
class EntitySearchQueryNotifier extends _$EntitySearchQueryNotifier {
  final _queryController = StreamController<String>();
  late final StreamSubscription<String> _subscription;

  @override
  String build() {
    _subscription = _queryController.stream
        .debounceTime(const Duration(milliseconds: 300))
        .listen(_updateState);
    ref.onDispose(() {
      _queryController.close();
      _subscription.cancel();
    });
    return '';
  }

  void _updateState(String query) {
    debugPrint('Query from _updateState: $query');
    state = query.trim();
  }

  void setQuery(String query) {
    debugPrint('Query from setQuery: $query');
    _queryController.sink.add(query);
  }
}

@riverpod
Future<List<SearchEntity>> entitySearchResults(
  Ref ref,
  CategoryId categoryId,
) async {
  final query = ref.watch(entitySearchQueryNotifierProvider);
  if (query.isEmpty) return [];

  // Get the appropriate repository based on category
  final repo = switch (categoryId) {
    1 => ref.watch(residenceSearchRepositoryProvider),
    2 => ref.watch(foodSearchRepositoryProvider),
    _ => throw InvalidCategoryException(),
  };

  return repo.search(query);
}
