// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_reviews_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedReviewsNotifierHash() =>
    r'adc476f69af45e11c6f932d8878f964377ac0d95';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PaginatedReviewsNotifier
    extends BuildlessAutoDisposeAsyncNotifier<ReviewPaginationState> {
  late final String entityId;
  late final ReviewSortOption sortOption;
  late final int? ratingFilter;

  FutureOr<ReviewPaginationState> build({
    required String entityId,
    ReviewSortOption sortOption = ReviewSortOption.latest,
    int? ratingFilter,
  });
}

/// See also [PaginatedReviewsNotifier].
@ProviderFor(PaginatedReviewsNotifier)
const paginatedReviewsNotifierProvider = PaginatedReviewsNotifierFamily();

/// See also [PaginatedReviewsNotifier].
class PaginatedReviewsNotifierFamily
    extends Family<AsyncValue<ReviewPaginationState>> {
  /// See also [PaginatedReviewsNotifier].
  const PaginatedReviewsNotifierFamily();

  /// See also [PaginatedReviewsNotifier].
  PaginatedReviewsNotifierProvider call({
    required String entityId,
    ReviewSortOption sortOption = ReviewSortOption.latest,
    int? ratingFilter,
  }) {
    return PaginatedReviewsNotifierProvider(
      entityId: entityId,
      sortOption: sortOption,
      ratingFilter: ratingFilter,
    );
  }

  @override
  PaginatedReviewsNotifierProvider getProviderOverride(
    covariant PaginatedReviewsNotifierProvider provider,
  ) {
    return call(
      entityId: provider.entityId,
      sortOption: provider.sortOption,
      ratingFilter: provider.ratingFilter,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'paginatedReviewsNotifierProvider';
}

/// See also [PaginatedReviewsNotifier].
class PaginatedReviewsNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          PaginatedReviewsNotifier,
          ReviewPaginationState
        > {
  /// See also [PaginatedReviewsNotifier].
  PaginatedReviewsNotifierProvider({
    required String entityId,
    ReviewSortOption sortOption = ReviewSortOption.latest,
    int? ratingFilter,
  }) : this._internal(
         () => PaginatedReviewsNotifier()
           ..entityId = entityId
           ..sortOption = sortOption
           ..ratingFilter = ratingFilter,
         from: paginatedReviewsNotifierProvider,
         name: r'paginatedReviewsNotifierProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$paginatedReviewsNotifierHash,
         dependencies: PaginatedReviewsNotifierFamily._dependencies,
         allTransitiveDependencies:
             PaginatedReviewsNotifierFamily._allTransitiveDependencies,
         entityId: entityId,
         sortOption: sortOption,
         ratingFilter: ratingFilter,
       );

  PaginatedReviewsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entityId,
    required this.sortOption,
    required this.ratingFilter,
  }) : super.internal();

  final String entityId;
  final ReviewSortOption sortOption;
  final int? ratingFilter;

  @override
  FutureOr<ReviewPaginationState> runNotifierBuild(
    covariant PaginatedReviewsNotifier notifier,
  ) {
    return notifier.build(
      entityId: entityId,
      sortOption: sortOption,
      ratingFilter: ratingFilter,
    );
  }

  @override
  Override overrideWith(PaginatedReviewsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedReviewsNotifierProvider._internal(
        () => create()
          ..entityId = entityId
          ..sortOption = sortOption
          ..ratingFilter = ratingFilter,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entityId: entityId,
        sortOption: sortOption,
        ratingFilter: ratingFilter,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    PaginatedReviewsNotifier,
    ReviewPaginationState
  >
  createElement() {
    return _PaginatedReviewsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedReviewsNotifierProvider &&
        other.entityId == entityId &&
        other.sortOption == sortOption &&
        other.ratingFilter == ratingFilter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);
    hash = _SystemHash.combine(hash, sortOption.hashCode);
    hash = _SystemHash.combine(hash, ratingFilter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedReviewsNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<ReviewPaginationState> {
  /// The parameter `entityId` of this provider.
  String get entityId;

  /// The parameter `sortOption` of this provider.
  ReviewSortOption get sortOption;

  /// The parameter `ratingFilter` of this provider.
  int? get ratingFilter;
}

class _PaginatedReviewsNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          PaginatedReviewsNotifier,
          ReviewPaginationState
        >
    with PaginatedReviewsNotifierRef {
  _PaginatedReviewsNotifierProviderElement(super.provider);

  @override
  String get entityId => (origin as PaginatedReviewsNotifierProvider).entityId;
  @override
  ReviewSortOption get sortOption =>
      (origin as PaginatedReviewsNotifierProvider).sortOption;
  @override
  int? get ratingFilter =>
      (origin as PaginatedReviewsNotifierProvider).ratingFilter;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
