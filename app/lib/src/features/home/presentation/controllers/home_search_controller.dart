import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/src/features/home/data/real/entity_search_repository.dart';
import 'package:app/src/features/home/domain/search_entitiy.dart';
import 'package:app/src/core/models/my_data_types.dart';

class HomeSearchController extends AsyncNotifier<List<SearchEntity>> {
  Timer? _debounce;

  @override
  FutureOr<List<SearchEntity>> build() {
    ref.onDispose(() => _debounce?.cancel());
    return [];
  }

  Future<void> search(CategoryId categoryId, String query) async {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      if (query.trim().isEmpty) {
        state = const AsyncData([]);
        return;
      }

      state = const AsyncLoading();

      try {
        final results = await ref.read(
          searchByCategoryIdProvider((
            categoryId: categoryId,
            query: query,
          )).future,
        );
        state = AsyncData(results);
      } catch (e, st) {
        state = AsyncError(e, st);
      }
    });
  }
}

final homeSearchControllerProvider =
    AsyncNotifierProvider<HomeSearchController, List<SearchEntity>>(
      HomeSearchController.new,
    );
