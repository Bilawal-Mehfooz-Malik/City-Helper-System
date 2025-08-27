// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_detail_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$entityDetailsServiceHash() =>
    r'3775a44bb75763598a69d209d445ed7ceeb483d3';

/// See also [entityDetailsService].
@ProviderFor(entityDetailsService)
final entityDetailsServiceProvider =
    AutoDisposeProvider<EntityDetailsService>.internal(
      entityDetailsService,
      name: r'entityDetailsServiceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$entityDetailsServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EntityDetailsServiceRef = AutoDisposeProviderRef<EntityDetailsService>;
String _$fetchEntityDetailsHash() =>
    r'1e2130e764c386478b7cb673352e3ce4a885ec38';

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

/// See also [fetchEntityDetails].
@ProviderFor(fetchEntityDetails)
const fetchEntityDetailsProvider = FetchEntityDetailsFamily();

/// See also [fetchEntityDetails].
class FetchEntityDetailsFamily extends Family<AsyncValue<EntityDetail?>> {
  /// See also [fetchEntityDetails].
  const FetchEntityDetailsFamily();

  /// See also [fetchEntityDetails].
  FetchEntityDetailsProvider call(int categoryId, String entityId) {
    return FetchEntityDetailsProvider(categoryId, entityId);
  }

  @override
  FetchEntityDetailsProvider getProviderOverride(
    covariant FetchEntityDetailsProvider provider,
  ) {
    return call(provider.categoryId, provider.entityId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchEntityDetailsProvider';
}

/// See also [fetchEntityDetails].
class FetchEntityDetailsProvider
    extends AutoDisposeFutureProvider<EntityDetail?> {
  /// See also [fetchEntityDetails].
  FetchEntityDetailsProvider(int categoryId, String entityId)
    : this._internal(
        (ref) => fetchEntityDetails(
          ref as FetchEntityDetailsRef,
          categoryId,
          entityId,
        ),
        from: fetchEntityDetailsProvider,
        name: r'fetchEntityDetailsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$fetchEntityDetailsHash,
        dependencies: FetchEntityDetailsFamily._dependencies,
        allTransitiveDependencies:
            FetchEntityDetailsFamily._allTransitiveDependencies,
        categoryId: categoryId,
        entityId: entityId,
      );

  FetchEntityDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.entityId,
  }) : super.internal();

  final int categoryId;
  final String entityId;

  @override
  Override overrideWith(
    FutureOr<EntityDetail?> Function(FetchEntityDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchEntityDetailsProvider._internal(
        (ref) => create(ref as FetchEntityDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        entityId: entityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EntityDetail?> createElement() {
    return _FetchEntityDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEntityDetailsProvider &&
        other.categoryId == categoryId &&
        other.entityId == entityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchEntityDetailsRef on AutoDisposeFutureProviderRef<EntityDetail?> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;

  /// The parameter `entityId` of this provider.
  String get entityId;
}

class _FetchEntityDetailsProviderElement
    extends AutoDisposeFutureProviderElement<EntityDetail?>
    with FetchEntityDetailsRef {
  _FetchEntityDetailsProviderElement(super.provider);

  @override
  int get categoryId => (origin as FetchEntityDetailsProvider).categoryId;
  @override
  String get entityId => (origin as FetchEntityDetailsProvider).entityId;
}

String _$fetchEntityWithReviewsHash() =>
    r'b2ff39beecccd6d843669fbfb9acb34934687352';

/// Combines entity detail and reviews into one fetch
///
/// Copied from [fetchEntityWithReviews].
@ProviderFor(fetchEntityWithReviews)
const fetchEntityWithReviewsProvider = FetchEntityWithReviewsFamily();

/// Combines entity detail and reviews into one fetch
///
/// Copied from [fetchEntityWithReviews].
class FetchEntityWithReviewsFamily
    extends Family<AsyncValue<(EntityDetail?, List<Review>)>> {
  /// Combines entity detail and reviews into one fetch
  ///
  /// Copied from [fetchEntityWithReviews].
  const FetchEntityWithReviewsFamily();

  /// Combines entity detail and reviews into one fetch
  ///
  /// Copied from [fetchEntityWithReviews].
  FetchEntityWithReviewsProvider call((int, String) args) {
    return FetchEntityWithReviewsProvider(args);
  }

  @override
  FetchEntityWithReviewsProvider getProviderOverride(
    covariant FetchEntityWithReviewsProvider provider,
  ) {
    return call(provider.args);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchEntityWithReviewsProvider';
}

/// Combines entity detail and reviews into one fetch
///
/// Copied from [fetchEntityWithReviews].
class FetchEntityWithReviewsProvider
    extends AutoDisposeFutureProvider<(EntityDetail?, List<Review>)> {
  /// Combines entity detail and reviews into one fetch
  ///
  /// Copied from [fetchEntityWithReviews].
  FetchEntityWithReviewsProvider((int, String) args)
    : this._internal(
        (ref) => fetchEntityWithReviews(ref as FetchEntityWithReviewsRef, args),
        from: fetchEntityWithReviewsProvider,
        name: r'fetchEntityWithReviewsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$fetchEntityWithReviewsHash,
        dependencies: FetchEntityWithReviewsFamily._dependencies,
        allTransitiveDependencies:
            FetchEntityWithReviewsFamily._allTransitiveDependencies,
        args: args,
      );

  FetchEntityWithReviewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.args,
  }) : super.internal();

  final (int, String) args;

  @override
  Override overrideWith(
    FutureOr<(EntityDetail?, List<Review>)> Function(
      FetchEntityWithReviewsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchEntityWithReviewsProvider._internal(
        (ref) => create(ref as FetchEntityWithReviewsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        args: args,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<(EntityDetail?, List<Review>)>
  createElement() {
    return _FetchEntityWithReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEntityWithReviewsProvider && other.args == args;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, args.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchEntityWithReviewsRef
    on AutoDisposeFutureProviderRef<(EntityDetail?, List<Review>)> {
  /// The parameter `args` of this provider.
  (int, String) get args;
}

class _FetchEntityWithReviewsProviderElement
    extends AutoDisposeFutureProviderElement<(EntityDetail?, List<Review>)>
    with FetchEntityWithReviewsRef {
  _FetchEntityWithReviewsProviderElement(super.provider);

  @override
  (int, String) get args => (origin as FetchEntityWithReviewsProvider).args;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
