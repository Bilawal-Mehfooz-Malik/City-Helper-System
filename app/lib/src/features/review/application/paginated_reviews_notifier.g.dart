// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_reviews_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedReviewsNotifier)
const paginatedReviewsProvider = PaginatedReviewsNotifierFamily._();

final class PaginatedReviewsNotifierProvider
    extends
        $AsyncNotifierProvider<
          PaginatedReviewsNotifier,
          ReviewPaginationState
        > {
  const PaginatedReviewsNotifierProvider._({
    required PaginatedReviewsNotifierFamily super.from,
    required ({
      EntityId entityId,
      ReviewSortOption sortOption,
      int? ratingFilter,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'paginatedReviewsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$paginatedReviewsNotifierHash();

  @override
  String toString() {
    return r'paginatedReviewsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  PaginatedReviewsNotifier create() => PaginatedReviewsNotifier();

  @override
  bool operator ==(Object other) {
    return other is PaginatedReviewsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paginatedReviewsNotifierHash() =>
    r'adc476f69af45e11c6f932d8878f964377ac0d95';

final class PaginatedReviewsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PaginatedReviewsNotifier,
          AsyncValue<ReviewPaginationState>,
          ReviewPaginationState,
          FutureOr<ReviewPaginationState>,
          ({EntityId entityId, ReviewSortOption sortOption, int? ratingFilter})
        > {
  const PaginatedReviewsNotifierFamily._()
    : super(
        retry: null,
        name: r'paginatedReviewsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PaginatedReviewsNotifierProvider call({
    required EntityId entityId,
    ReviewSortOption sortOption = ReviewSortOption.latest,
    int? ratingFilter,
  }) => PaginatedReviewsNotifierProvider._(
    argument: (
      entityId: entityId,
      sortOption: sortOption,
      ratingFilter: ratingFilter,
    ),
    from: this,
  );

  @override
  String toString() => r'paginatedReviewsProvider';
}

abstract class _$PaginatedReviewsNotifier
    extends $AsyncNotifier<ReviewPaginationState> {
  late final _$args =
      ref.$arg
          as ({
            EntityId entityId,
            ReviewSortOption sortOption,
            int? ratingFilter,
          });
  EntityId get entityId => _$args.entityId;
  ReviewSortOption get sortOption => _$args.sortOption;
  int? get ratingFilter => _$args.ratingFilter;

  FutureOr<ReviewPaginationState> build({
    required EntityId entityId,
    ReviewSortOption sortOption = ReviewSortOption.latest,
    int? ratingFilter,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      entityId: _$args.entityId,
      sortOption: _$args.sortOption,
      ratingFilter: _$args.ratingFilter,
    );
    final ref =
        this.ref
            as $Ref<AsyncValue<ReviewPaginationState>, ReviewPaginationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ReviewPaginationState>,
                ReviewPaginationState
              >,
              AsyncValue<ReviewPaginationState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
