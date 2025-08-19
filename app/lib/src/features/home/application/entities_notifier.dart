import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/application/filtering_logic.dart';
import 'package:app/src/features/home/application/pagination_limit_provider.dart';
import 'package:app/src/features/home/domain/entities_pagination_state.dart';
import 'package:app/src/features/home/presentation/controllers/filter_controller.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entities_notifier.g.dart';

@Riverpod(keepAlive: true)
class EntitiesNotifier extends _$EntitiesNotifier {
  @override
  EntitiesPaginatedState build(CategoryId categoryId) {
    fetchFirstPage();
    return const EntitiesPaginatedState();
  }

  Future<void> fetchFirstPage() async {
    final subcategoryId = ref.read(subcategoryControllerProvider);
    final filter = ref.read(filterControllerProvider(categoryId: categoryId));

    try {
      final entities = await ref
          .read(entityServiceProvider)
          .fetchEntitiesPaginated(
            categoryId: categoryId,
            subcategoryId: subcategoryId,
          );

      final filtered = filterEntities(entities, filter);
      final sorted = sortEntities(filtered, filter);

      final hasMore = entities.length == ref.read(entitiesLimitProvider);

      state = state.copyWith(entities: sorted, hasMore: hasMore);
    } catch (e, _) {
      state = state.copyWith(paginationError: e);
    }
  }

  Future<void> fetchNextPage() async {
    if (state.isLoadingNextPage || !state.hasMore) return;

    state = state.copyWith(isLoadingNextPage: true, paginationError: null);

    final subcategoryId = ref.read(subcategoryControllerProvider);
    final filter = ref.read(filterControllerProvider(categoryId: categoryId));

    try {
      final lastEntityId = state.entities.last.id;
      final newEntities = await ref
          .read(entityServiceProvider)
          .fetchEntitiesPaginated(
            categoryId: categoryId,
            subcategoryId: subcategoryId,
            lastEntityId: lastEntityId,
          );

      final filtered = filterEntities(newEntities, filter);
      final sorted = sortEntities(filtered, filter);

      final hasMore = newEntities.length == ref.read(entitiesLimitProvider);

      state = state.copyWith(
        isLoadingNextPage: false,
        entities: [...state.entities, ...sorted],
        hasMore: hasMore,
      );
    } catch (e, _) {
      state = state.copyWith(isLoadingNextPage: false, paginationError: e);
    }
  }
}
