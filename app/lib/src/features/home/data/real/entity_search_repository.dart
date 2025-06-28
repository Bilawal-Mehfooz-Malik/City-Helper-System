import 'dart:async';
import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:app/src/core/app_config/env.dart';
import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/search_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entity_search_repository.g.dart';

class EntitySearchRepository {
  const EntitySearchRepository(this._searcher);
  final HitsSearcher _searcher;

  Future<List<SearchEntity>> search(String query) async {
    try {
      _searcher.query(query);
      final response = await _searcher.responses.first;
      return response.hits.map((hit) {
        debugPrint('Results from EntitySearchRepository: $hit');
        return SearchEntity.fromJson(Map<String, dynamic>.from(hit));
      }).toList();
    } catch (e) {
      AppLogger.logError('Algolia search error: $e');
      return [];
    }
  }
}

@Riverpod(keepAlive: true)
EntitySearchRepository residenceSearchRepository(Ref ref) {
  final searcher = HitsSearcher(
    applicationID: Env.algoliaAppId,
    apiKey: Env.algoliaSearchKey,
    indexName: 'residence_listings_index',
  );
  return EntitySearchRepository(searcher);
}

@Riverpod(keepAlive: true)
EntitySearchRepository foodSearchRepository(Ref ref) {
  final searcher = HitsSearcher(
    applicationID: Env.algoliaAppId,
    apiKey: Env.algoliaSearchKey,
    indexName: 'food_listings_index',
  );
  return EntitySearchRepository(searcher);
}

@riverpod
Future<List<SearchEntity>> searchByCategoryId(
  Ref ref,
  ({CategoryId categoryId, String query}) input,
) async {
  final link = ref.keepAlive();
  Timer? timer;
  ref.onDispose(() => timer?.cancel());
  ref.onCancel(
    () => timer = Timer(const Duration(seconds: 30), () => link.close()),
  );
  ref.onResume(() => timer?.cancel());

  if (input.query.isEmpty) return [];

  if (input.categoryId == 1) {
    final repo = ref.watch(residenceSearchRepositoryProvider);
    return repo.search(input.query);
  } else if (input.categoryId == 2) {
    final repo = ref.watch(foodSearchRepositoryProvider);
    return repo.search(input.query);
  } else {
    return [];
  }
}
