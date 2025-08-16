import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/application/pagination_limit_provider.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'popular_entities_paginated_provider.freezed.dart';
part 'popular_entities_paginated_provider.g.dart';

@freezed
abstract class PopularEntitiesPaginatedState
    with _$PopularEntitiesPaginatedState {
  const factory PopularEntitiesPaginatedState({
    @Default([]) List<Entity> entities,
    @Default(true) bool hasMore,
    Object? paginationError,
    @Default(false) bool isLoadingNextPage,
  }) = _PopularEntitiesPaginatedState;
}

@Riverpod(keepAlive: true)
class PopularEntitiesNotifier extends _$PopularEntitiesNotifier {
  @override
  PopularEntitiesPaginatedState build() {
    // The build method should not return a future.
    // We trigger the first fetch and return the initial state.
    fetchFirstPage();
    return const PopularEntitiesPaginatedState();
  }

  Future<void> fetchFirstPage() async {
    // For now, we are hardcoding categoryId as 1. This should be passed from the UI.
    // This is a temporary solution to get the feature working.
    const categoryId = 1;
    try {
      final entities = await ref
          .read(entityServiceProvider)
          .fetchPopularEntitiesPaginated(categoryId: categoryId);

      final hasMore = entities.length == ref.read(popularEntitiesLimitProvider);

      state = state.copyWith(entities: entities, hasMore: hasMore);
    } catch (e, _) {
      state = state.copyWith(paginationError: e);
    }
  }

  Future<void> fetchNextPage() async {
    if (state.isLoadingNextPage || !state.hasMore) return;

    state = state.copyWith(isLoadingNextPage: true, paginationError: null);

    const categoryId = 1; // This should also be passed from the UI

    try {
      final lastEntityId = state.entities.last.id;
      final newEntities = await ref
          .read(entityServiceProvider)
          .fetchPopularEntitiesPaginated(
            categoryId: categoryId,
            lastEntityId: lastEntityId,
          );

      final hasMore =
          newEntities.length == ref.read(popularEntitiesLimitProvider);

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
