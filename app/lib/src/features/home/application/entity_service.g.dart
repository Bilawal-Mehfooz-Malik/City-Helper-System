// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$entityServiceHash() => r'00643418bb39b869ae1f68400734454c994fc864';

/// See also [entityService].
@ProviderFor(entityService)
final entityServiceProvider = AutoDisposeProvider<EntityService>.internal(
  entityService,
  name: r'entityServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$entityServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EntityServiceRef = AutoDisposeProviderRef<EntityService>;
String _$watchPopularEntitiesHash() =>
    r'ac525ed7a062176cba842d403f2450f8f2317713';

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

/// See also [watchPopularEntities].
@ProviderFor(watchPopularEntities)
const watchPopularEntitiesProvider = WatchPopularEntitiesFamily();

/// See also [watchPopularEntities].
class WatchPopularEntitiesFamily extends Family<AsyncValue<List<Entity>>> {
  /// See also [watchPopularEntities].
  const WatchPopularEntitiesFamily();

  /// See also [watchPopularEntities].
  WatchPopularEntitiesProvider call(int categoryId, int? subcategoryId) {
    return WatchPopularEntitiesProvider(categoryId, subcategoryId);
  }

  @override
  WatchPopularEntitiesProvider getProviderOverride(
    covariant WatchPopularEntitiesProvider provider,
  ) {
    return call(provider.categoryId, provider.subcategoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchPopularEntitiesProvider';
}

/// See also [watchPopularEntities].
class WatchPopularEntitiesProvider
    extends AutoDisposeStreamProvider<List<Entity>> {
  /// See also [watchPopularEntities].
  WatchPopularEntitiesProvider(int categoryId, int? subcategoryId)
    : this._internal(
        (ref) => watchPopularEntities(
          ref as WatchPopularEntitiesRef,
          categoryId,
          subcategoryId,
        ),
        from: watchPopularEntitiesProvider,
        name: r'watchPopularEntitiesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchPopularEntitiesHash,
        dependencies: WatchPopularEntitiesFamily._dependencies,
        allTransitiveDependencies:
            WatchPopularEntitiesFamily._allTransitiveDependencies,
        categoryId: categoryId,
        subcategoryId: subcategoryId,
      );

  WatchPopularEntitiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.subcategoryId,
  }) : super.internal();

  final int categoryId;
  final int? subcategoryId;

  @override
  Override overrideWith(
    Stream<List<Entity>> Function(WatchPopularEntitiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchPopularEntitiesProvider._internal(
        (ref) => create(ref as WatchPopularEntitiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        subcategoryId: subcategoryId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Entity>> createElement() {
    return _WatchPopularEntitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchPopularEntitiesProvider &&
        other.categoryId == categoryId &&
        other.subcategoryId == subcategoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, subcategoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchPopularEntitiesRef on AutoDisposeStreamProviderRef<List<Entity>> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;

  /// The parameter `subcategoryId` of this provider.
  int? get subcategoryId;
}

class _WatchPopularEntitiesProviderElement
    extends AutoDisposeStreamProviderElement<List<Entity>>
    with WatchPopularEntitiesRef {
  _WatchPopularEntitiesProviderElement(super.provider);

  @override
  int get categoryId => (origin as WatchPopularEntitiesProvider).categoryId;
  @override
  int? get subcategoryId =>
      (origin as WatchPopularEntitiesProvider).subcategoryId;
}

String _$watchEntitiesHash() => r'9e24b79e79379fead9de461f67a563808312ff05';

/// See also [watchEntities].
@ProviderFor(watchEntities)
const watchEntitiesProvider = WatchEntitiesFamily();

/// See also [watchEntities].
class WatchEntitiesFamily extends Family<AsyncValue<List<Entity>>> {
  /// See also [watchEntities].
  const WatchEntitiesFamily();

  /// See also [watchEntities].
  WatchEntitiesProvider call(int categoryId, int? subcategoryId) {
    return WatchEntitiesProvider(categoryId, subcategoryId);
  }

  @override
  WatchEntitiesProvider getProviderOverride(
    covariant WatchEntitiesProvider provider,
  ) {
    return call(provider.categoryId, provider.subcategoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchEntitiesProvider';
}

/// See also [watchEntities].
class WatchEntitiesProvider extends AutoDisposeStreamProvider<List<Entity>> {
  /// See also [watchEntities].
  WatchEntitiesProvider(int categoryId, int? subcategoryId)
    : this._internal(
        (ref) =>
            watchEntities(ref as WatchEntitiesRef, categoryId, subcategoryId),
        from: watchEntitiesProvider,
        name: r'watchEntitiesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchEntitiesHash,
        dependencies: WatchEntitiesFamily._dependencies,
        allTransitiveDependencies:
            WatchEntitiesFamily._allTransitiveDependencies,
        categoryId: categoryId,
        subcategoryId: subcategoryId,
      );

  WatchEntitiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.subcategoryId,
  }) : super.internal();

  final int categoryId;
  final int? subcategoryId;

  @override
  Override overrideWith(
    Stream<List<Entity>> Function(WatchEntitiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchEntitiesProvider._internal(
        (ref) => create(ref as WatchEntitiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        subcategoryId: subcategoryId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Entity>> createElement() {
    return _WatchEntitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchEntitiesProvider &&
        other.categoryId == categoryId &&
        other.subcategoryId == subcategoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, subcategoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchEntitiesRef on AutoDisposeStreamProviderRef<List<Entity>> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;

  /// The parameter `subcategoryId` of this provider.
  int? get subcategoryId;
}

class _WatchEntitiesProviderElement
    extends AutoDisposeStreamProviderElement<List<Entity>>
    with WatchEntitiesRef {
  _WatchEntitiesProviderElement(super.provider);

  @override
  int get categoryId => (origin as WatchEntitiesProvider).categoryId;
  @override
  int? get subcategoryId => (origin as WatchEntitiesProvider).subcategoryId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
