// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reviewsRepositoryHash() => r'386dc424ba08ff337752463d9950fdc03ffdeac0';

/// See also [reviewsRepository].
@ProviderFor(reviewsRepository)
final reviewsRepositoryProvider =
    AutoDisposeProvider<ReviewsRepository>.internal(
      reviewsRepository,
      name: r'reviewsRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$reviewsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReviewsRepositoryRef = AutoDisposeProviderRef<ReviewsRepository>;
String _$fetchReviewsListHash() => r'30bb63f473fd86802ca37ee35f4cb32af24e1c4c';

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

/// See also [fetchReviewsList].
@ProviderFor(fetchReviewsList)
const fetchReviewsListProvider = FetchReviewsListFamily();

/// See also [fetchReviewsList].
class FetchReviewsListFamily extends Family<AsyncValue<List<Review>>> {
  /// See also [fetchReviewsList].
  const FetchReviewsListFamily();

  /// See also [fetchReviewsList].
  FetchReviewsListProvider call(String entityId) {
    return FetchReviewsListProvider(entityId);
  }

  @override
  FetchReviewsListProvider getProviderOverride(
    covariant FetchReviewsListProvider provider,
  ) {
    return call(provider.entityId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchReviewsListProvider';
}

/// See also [fetchReviewsList].
class FetchReviewsListProvider extends AutoDisposeFutureProvider<List<Review>> {
  /// See also [fetchReviewsList].
  FetchReviewsListProvider(String entityId)
    : this._internal(
        (ref) => fetchReviewsList(ref as FetchReviewsListRef, entityId),
        from: fetchReviewsListProvider,
        name: r'fetchReviewsListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$fetchReviewsListHash,
        dependencies: FetchReviewsListFamily._dependencies,
        allTransitiveDependencies:
            FetchReviewsListFamily._allTransitiveDependencies,
        entityId: entityId,
      );

  FetchReviewsListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entityId,
  }) : super.internal();

  final String entityId;

  @override
  Override overrideWith(
    FutureOr<List<Review>> Function(FetchReviewsListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchReviewsListProvider._internal(
        (ref) => create(ref as FetchReviewsListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entityId: entityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Review>> createElement() {
    return _FetchReviewsListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchReviewsListProvider && other.entityId == entityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchReviewsListRef on AutoDisposeFutureProviderRef<List<Review>> {
  /// The parameter `entityId` of this provider.
  String get entityId;
}

class _FetchReviewsListProviderElement
    extends AutoDisposeFutureProviderElement<List<Review>>
    with FetchReviewsListRef {
  _FetchReviewsListProviderElement(super.provider);

  @override
  String get entityId => (origin as FetchReviewsListProvider).entityId;
}

String _$watchReviewsListHash() => r'41a913dfc617729377d7182e71bdab2e63cdce27';

/// See also [watchReviewsList].
@ProviderFor(watchReviewsList)
const watchReviewsListProvider = WatchReviewsListFamily();

/// See also [watchReviewsList].
class WatchReviewsListFamily extends Family<AsyncValue<List<Review>>> {
  /// See also [watchReviewsList].
  const WatchReviewsListFamily();

  /// See also [watchReviewsList].
  WatchReviewsListProvider call(String entityId) {
    return WatchReviewsListProvider(entityId);
  }

  @override
  WatchReviewsListProvider getProviderOverride(
    covariant WatchReviewsListProvider provider,
  ) {
    return call(provider.entityId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchReviewsListProvider';
}

/// See also [watchReviewsList].
class WatchReviewsListProvider extends AutoDisposeStreamProvider<List<Review>> {
  /// See also [watchReviewsList].
  WatchReviewsListProvider(String entityId)
    : this._internal(
        (ref) => watchReviewsList(ref as WatchReviewsListRef, entityId),
        from: watchReviewsListProvider,
        name: r'watchReviewsListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchReviewsListHash,
        dependencies: WatchReviewsListFamily._dependencies,
        allTransitiveDependencies:
            WatchReviewsListFamily._allTransitiveDependencies,
        entityId: entityId,
      );

  WatchReviewsListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entityId,
  }) : super.internal();

  final String entityId;

  @override
  Override overrideWith(
    Stream<List<Review>> Function(WatchReviewsListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchReviewsListProvider._internal(
        (ref) => create(ref as WatchReviewsListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entityId: entityId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Review>> createElement() {
    return _WatchReviewsListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchReviewsListProvider && other.entityId == entityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchReviewsListRef on AutoDisposeStreamProviderRef<List<Review>> {
  /// The parameter `entityId` of this provider.
  String get entityId;
}

class _WatchReviewsListProviderElement
    extends AutoDisposeStreamProviderElement<List<Review>>
    with WatchReviewsListRef {
  _WatchReviewsListProviderElement(super.provider);

  @override
  String get entityId => (origin as WatchReviewsListProvider).entityId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
