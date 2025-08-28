// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reviewsRepositoryHash() => r'3fb24588000e73703376cd09115a47596b121903';

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

String _$userReviewFutureHash() => r'ccc1b9a1f2c9964fc044ac7e747ea7b0551a328e';

/// See also [userReviewFuture].
@ProviderFor(userReviewFuture)
const userReviewFutureProvider = UserReviewFutureFamily();

/// See also [userReviewFuture].
class UserReviewFutureFamily extends Family<AsyncValue<Review?>> {
  /// See also [userReviewFuture].
  const UserReviewFutureFamily();

  /// See also [userReviewFuture].
  UserReviewFutureProvider call(String entityId) {
    return UserReviewFutureProvider(entityId);
  }

  @override
  UserReviewFutureProvider getProviderOverride(
    covariant UserReviewFutureProvider provider,
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
  String? get name => r'userReviewFutureProvider';
}

/// See also [userReviewFuture].
class UserReviewFutureProvider extends AutoDisposeFutureProvider<Review?> {
  /// See also [userReviewFuture].
  UserReviewFutureProvider(String entityId)
    : this._internal(
        (ref) => userReviewFuture(ref as UserReviewFutureRef, entityId),
        from: userReviewFutureProvider,
        name: r'userReviewFutureProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$userReviewFutureHash,
        dependencies: UserReviewFutureFamily._dependencies,
        allTransitiveDependencies:
            UserReviewFutureFamily._allTransitiveDependencies,
        entityId: entityId,
      );

  UserReviewFutureProvider._internal(
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
    FutureOr<Review?> Function(UserReviewFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserReviewFutureProvider._internal(
        (ref) => create(ref as UserReviewFutureRef),
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
  AutoDisposeFutureProviderElement<Review?> createElement() {
    return _UserReviewFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserReviewFutureProvider && other.entityId == entityId;
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
mixin UserReviewFutureRef on AutoDisposeFutureProviderRef<Review?> {
  /// The parameter `entityId` of this provider.
  String get entityId;
}

class _UserReviewFutureProviderElement
    extends AutoDisposeFutureProviderElement<Review?>
    with UserReviewFutureRef {
  _UserReviewFutureProviderElement(super.provider);

  @override
  String get entityId => (origin as UserReviewFutureProvider).entityId;
}

String _$reviewsPreviewListHash() =>
    r'b0eaaa7e09d43247fae4735a5b3cacfea964d85d';

/// See also [reviewsPreviewList].
@ProviderFor(reviewsPreviewList)
const reviewsPreviewListProvider = ReviewsPreviewListFamily();

/// See also [reviewsPreviewList].
class ReviewsPreviewListFamily extends Family<AsyncValue<List<Review>>> {
  /// See also [reviewsPreviewList].
  const ReviewsPreviewListFamily();

  /// See also [reviewsPreviewList].
  ReviewsPreviewListProvider call(String entityId) {
    return ReviewsPreviewListProvider(entityId);
  }

  @override
  ReviewsPreviewListProvider getProviderOverride(
    covariant ReviewsPreviewListProvider provider,
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
  String? get name => r'reviewsPreviewListProvider';
}

/// See also [reviewsPreviewList].
class ReviewsPreviewListProvider
    extends AutoDisposeFutureProvider<List<Review>> {
  /// See also [reviewsPreviewList].
  ReviewsPreviewListProvider(String entityId)
    : this._internal(
        (ref) => reviewsPreviewList(ref as ReviewsPreviewListRef, entityId),
        from: reviewsPreviewListProvider,
        name: r'reviewsPreviewListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$reviewsPreviewListHash,
        dependencies: ReviewsPreviewListFamily._dependencies,
        allTransitiveDependencies:
            ReviewsPreviewListFamily._allTransitiveDependencies,
        entityId: entityId,
      );

  ReviewsPreviewListProvider._internal(
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
    FutureOr<List<Review>> Function(ReviewsPreviewListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReviewsPreviewListProvider._internal(
        (ref) => create(ref as ReviewsPreviewListRef),
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
    return _ReviewsPreviewListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReviewsPreviewListProvider && other.entityId == entityId;
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
mixin ReviewsPreviewListRef on AutoDisposeFutureProviderRef<List<Review>> {
  /// The parameter `entityId` of this provider.
  String get entityId;
}

class _ReviewsPreviewListProviderElement
    extends AutoDisposeFutureProviderElement<List<Review>>
    with ReviewsPreviewListRef {
  _ReviewsPreviewListProviderElement(super.provider);

  @override
  String get entityId => (origin as ReviewsPreviewListProvider).entityId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
