// import 'dart:async';
// import 'package:app/src/core/models/my_data_types.dart';
// import 'package:app/src/core/utils/in_memory_store.dart';
// import 'package:app/src/features/home/data/real/entity_search_repository.dart';
// import 'package:app/src/features/home/domain/home_exceptions.dart';
// import 'package:app/src/features/home/domain/search_entitiy.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:rxdart/rxdart.dart';

// part 'entity_search_query_notifier.g.dart';

// @riverpod
// class EntitySearchQueryNotifier extends _$EntitySearchQueryNotifier {
//   late final InMemoryStore<String> _queryStore;
//   late final StreamSubscription<String> _subscription;

//   @override
//   String build() {
//     _queryStore = InMemoryStore('');
//     _subscription = _queryStore.stream
//         .debounceTime(const Duration(milliseconds: 200))
//         .listen((debounced) {
//           state = debounced.trim();
//         });

//     ref.onDispose(() {
//       _queryStore.close();
//       _subscription.cancel();
//     });

//     return '';
//   }

//   void setQuery(String query) {
//     _queryStore.value = query;
//   }
// }

// @riverpod
// Future<List<SearchEntity>> entitySearchResults(
//   Ref ref,
//   CategoryId categoryId,
// ) async {
//   final query = ref.watch(entitySearchQueryNotifierProvider);
//   if (query.isEmpty) return [];

//   final repo = switch (categoryId) {
//     1 => ref.watch(residenceSearchRepositoryProvider),
//     2 => ref.watch(foodSearchRepositoryProvider),
//     _ => throw InvalidCategoryException(),
//   };

//   return repo.search(query);
// }
