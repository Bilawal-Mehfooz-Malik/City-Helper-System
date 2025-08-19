import 'package:app/src/features/home/domain/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities_pagination_state.freezed.dart';

@freezed
abstract class EntitiesPaginatedState with _$EntitiesPaginatedState {
  const factory EntitiesPaginatedState({
    @Default([]) List<Entity> entities,
    @Default(true) bool hasMore,
    Object? paginationError,
    @Default(false) bool isLoadingNextPage,
  }) = _EntitiesPaginatedState;
}
