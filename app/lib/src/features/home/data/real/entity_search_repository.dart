import 'dart:async';
import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:app/src/core/app_config/env.dart';
import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/search_entitiy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EntitySearchRepository {
  EntitySearchRepository(this._searcher);

  final HitsSearcher _searcher;

  final _cache = <String, List<SearchEntity>>{};

  Future<List<SearchEntity>> search(String query) async {
    final trimmedQuery = query.trim().toLowerCase();

    final cachedPrefix = _cache.keys.where((k) {
      return trimmedQuery.startsWith(k);
    }).toList()..sort((a, b) => b.length.compareTo(a.length));

    if (cachedPrefix.isNotEmpty) {
      final match = cachedPrefix.first;
      final cachedResults = _cache[match]!;

      final filtered = cachedResults
          .where((e) => e.name.toLowerCase().contains(trimmedQuery))
          .toList();

      return filtered;
    }

    // Fallback: fresh API call
    try {
      _searcher.query(trimmedQuery);
      final response = await _searcher.responses.first;
      final results = response.hits.map((hit) {
        return SearchEntity.fromJson(Map<String, dynamic>.from(hit));
      }).toList();

      _cache[trimmedQuery] = results;
      return results;
    } catch (e) {
      AppLogger.logError('Algolia search error: $e');
      return [];
    }
  }
}

final residenceSearchRepositoryProvider = Provider<EntitySearchRepository>((
  ref,
) {
  final searcher =
      HitsSearcher(
        applicationID: Env.algoliaAppId,
        apiKey: Env.algoliaSearchKey,
        indexName: 'residence_listings_index',
      )..applyState(
        (state) => state.copyWith(facetFilters: ["approvalStatus:approved"]),
      );

  return EntitySearchRepository(searcher);
});

final foodSearchRepositoryProvider = Provider<EntitySearchRepository>((ref) {
  final searcher =
      HitsSearcher(
        applicationID: Env.algoliaAppId,
        apiKey: Env.algoliaSearchKey,
        indexName: 'food_listings_index',
      )..applyState(
        (state) => state.copyWith(facetFilters: ["approvalStatus:approved"]),
      );

  return EntitySearchRepository(searcher);
});

final searchByCategoryIdProvider = FutureProvider.family
    .autoDispose<List<SearchEntity>, ({CategoryId categoryId, String query})>((
      ref,
      input,
    ) async {
      final link = ref.keepAlive();
      Timer? timer;
      ref.onDispose(() => timer?.cancel());
      ref.onCancel(() {
        timer = Timer(const Duration(seconds: 30), () => link.close());
      });
      ref.onResume(() => timer?.cancel());

      if (input.query.isEmpty) return [];

      if (input.categoryId == 1) {
        final repo = ref.read(residenceSearchRepositoryProvider);
        return repo.search(input.query);
      } else if (input.categoryId == 2) {
        final repo = ref.read(foodSearchRepositoryProvider);
        return repo.search(input.query);
      } else {
        return [];
      }
    });
