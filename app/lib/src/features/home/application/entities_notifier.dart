import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/application/pagination_limit_provider.dart';
import 'package:app/src/features/home/domain/entities_pagination_state.dart';
import 'package:app/src/features/home/presentation/controllers/filter_controller.dart'; // Reverted import
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entities_notifier.g.dart';

@Riverpod(keepAlive: true)
class EntitiesNotifier extends _$EntitiesNotifier {
  @override
  EntitiesPaginatedState build(CategoryId categoryId) {
    // Watch the filter and subcategory providers to react to changes
    ref.watch(
      filterControllerProvider(categoryId: categoryId),
    ); // Reverted provider
    ref.watch(subcategoryControllerProvider);

    fetchFirstPage();
    return const EntitiesPaginatedState();
  }

  Future<void> fetchFirstPage() async {
    final subcategoryId = ref.read(subcategoryControllerProvider);
    final filter = ref.read(filterControllerProvider(categoryId: categoryId));

    try {
      final limit = ref.read(initialLoadLimitProvider);
      final entities = await ref
          .read(entityServiceProvider)
          .fetchEntitiesPaginated(
            categoryId: categoryId,
            subcategoryId: subcategoryId,
            limit: limit,
            filter: filter,
          );

      final hasMore = entities.length == limit;

      state = state.copyWith(entities: entities, hasMore: hasMore);
    } catch (e, _) {
      state = state.copyWith(paginationError: e);
    }
  }

  Future<void> fetchNextPage() async {
    if (state.isLoadingNextPage || !state.hasMore) return;

    state = state.copyWith(isLoadingNextPage: true, paginationError: null);

    final subcategoryId = ref.read(subcategoryControllerProvider);
    final filter = ref.read(
      filterControllerProvider(categoryId: categoryId),
    ); // Reverted provider

    try {
      final limit = ref.read(subsequentLoadLimitProvider);
      final lastEntityId = state.entities.last.id;
      final newEntities = await ref
          .read(entityServiceProvider)
          .fetchEntitiesPaginated(
            categoryId: categoryId,
            subcategoryId: subcategoryId,
            lastEntityId: lastEntityId,
            limit: limit,
            filter: filter,
          );

      final hasMore = newEntities.length == limit;

      state = state.copyWith(
        isLoadingNextPage: false,
        entities: [...state.entities, ...newEntities],
        hasMore: hasMore,
      );
    } catch (e, _) {
      state = state.copyWith(isLoadingNextPage: false, paginationError: e);
    }
  }
}
