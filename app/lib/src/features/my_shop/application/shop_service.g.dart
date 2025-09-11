// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shopServiceHash() => r'e653b2ff8bf17b06b4447abde134ee458adaae21';

/// See also [shopService].
@ProviderFor(shopService)
final shopServiceProvider = AutoDisposeProvider<ShopService>.internal(
  shopService,
  name: r'shopServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shopServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShopServiceRef = AutoDisposeProviderRef<ShopService>;
String _$fetchUserShopHash() => r'da2f163b7daba7b064743cc98c61294235fc5bc6';

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

/// See also [fetchUserShop].
@ProviderFor(fetchUserShop)
const fetchUserShopProvider = FetchUserShopFamily();

/// See also [fetchUserShop].
class FetchUserShopFamily extends Family<AsyncValue<EntityDetail?>> {
  /// See also [fetchUserShop].
  const FetchUserShopFamily();

  /// See also [fetchUserShop].
  FetchUserShopProvider call(String userId) {
    return FetchUserShopProvider(userId);
  }

  @override
  FetchUserShopProvider getProviderOverride(
    covariant FetchUserShopProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchUserShopProvider';
}

/// See also [fetchUserShop].
class FetchUserShopProvider extends AutoDisposeFutureProvider<EntityDetail?> {
  /// See also [fetchUserShop].
  FetchUserShopProvider(String userId)
    : this._internal(
        (ref) => fetchUserShop(ref as FetchUserShopRef, userId),
        from: fetchUserShopProvider,
        name: r'fetchUserShopProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$fetchUserShopHash,
        dependencies: FetchUserShopFamily._dependencies,
        allTransitiveDependencies:
            FetchUserShopFamily._allTransitiveDependencies,
        userId: userId,
      );

  FetchUserShopProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<EntityDetail?> Function(FetchUserShopRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUserShopProvider._internal(
        (ref) => create(ref as FetchUserShopRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EntityDetail?> createElement() {
    return _FetchUserShopProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserShopProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchUserShopRef on AutoDisposeFutureProviderRef<EntityDetail?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _FetchUserShopProviderElement
    extends AutoDisposeFutureProviderElement<EntityDetail?>
    with FetchUserShopRef {
  _FetchUserShopProviderElement(super.provider);

  @override
  String get userId => (origin as FetchUserShopProvider).userId;
}

String _$watchUserShopHash() => r'd66071cdcaf8f5676080c27fd95a296a6e52c15a';

/// See also [watchUserShop].
@ProviderFor(watchUserShop)
const watchUserShopProvider = WatchUserShopFamily();

/// See also [watchUserShop].
class WatchUserShopFamily extends Family<AsyncValue<EntityDetail?>> {
  /// See also [watchUserShop].
  const WatchUserShopFamily();

  /// See also [watchUserShop].
  WatchUserShopProvider call(String userId) {
    return WatchUserShopProvider(userId);
  }

  @override
  WatchUserShopProvider getProviderOverride(
    covariant WatchUserShopProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchUserShopProvider';
}

/// See also [watchUserShop].
class WatchUserShopProvider extends AutoDisposeStreamProvider<EntityDetail?> {
  /// See also [watchUserShop].
  WatchUserShopProvider(String userId)
    : this._internal(
        (ref) => watchUserShop(ref as WatchUserShopRef, userId),
        from: watchUserShopProvider,
        name: r'watchUserShopProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$watchUserShopHash,
        dependencies: WatchUserShopFamily._dependencies,
        allTransitiveDependencies:
            WatchUserShopFamily._allTransitiveDependencies,
        userId: userId,
      );

  WatchUserShopProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<EntityDetail?> Function(WatchUserShopRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchUserShopProvider._internal(
        (ref) => create(ref as WatchUserShopRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<EntityDetail?> createElement() {
    return _WatchUserShopProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchUserShopProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchUserShopRef on AutoDisposeStreamProviderRef<EntityDetail?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _WatchUserShopProviderElement
    extends AutoDisposeStreamProviderElement<EntityDetail?>
    with WatchUserShopRef {
  _WatchUserShopProviderElement(super.provider);

  @override
  String get userId => (origin as WatchUserShopProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
