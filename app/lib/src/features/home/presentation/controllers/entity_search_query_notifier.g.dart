// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_search_query_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$entitySearchResultsHash() =>
    r'5ebb96be68afd432559e60659463d13ee6761187';

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

/// See also [entitySearchResults].
@ProviderFor(entitySearchResults)
const entitySearchResultsProvider = EntitySearchResultsFamily();

/// See also [entitySearchResults].
class EntitySearchResultsFamily extends Family<AsyncValue<List<SearchEntity>>> {
  /// See also [entitySearchResults].
  const EntitySearchResultsFamily();

  /// See also [entitySearchResults].
  EntitySearchResultsProvider call(int categoryId) {
    return EntitySearchResultsProvider(categoryId);
  }

  @override
  EntitySearchResultsProvider getProviderOverride(
    covariant EntitySearchResultsProvider provider,
  ) {
    return call(provider.categoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'entitySearchResultsProvider';
}

/// See also [entitySearchResults].
class EntitySearchResultsProvider
    extends AutoDisposeFutureProvider<List<SearchEntity>> {
  /// See also [entitySearchResults].
  EntitySearchResultsProvider(int categoryId)
    : this._internal(
        (ref) => entitySearchResults(ref as EntitySearchResultsRef, categoryId),
        from: entitySearchResultsProvider,
        name: r'entitySearchResultsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$entitySearchResultsHash,
        dependencies: EntitySearchResultsFamily._dependencies,
        allTransitiveDependencies:
            EntitySearchResultsFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  EntitySearchResultsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final int categoryId;

  @override
  Override overrideWith(
    FutureOr<List<SearchEntity>> Function(EntitySearchResultsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EntitySearchResultsProvider._internal(
        (ref) => create(ref as EntitySearchResultsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SearchEntity>> createElement() {
    return _EntitySearchResultsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EntitySearchResultsProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EntitySearchResultsRef
    on AutoDisposeFutureProviderRef<List<SearchEntity>> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;
}

class _EntitySearchResultsProviderElement
    extends AutoDisposeFutureProviderElement<List<SearchEntity>>
    with EntitySearchResultsRef {
  _EntitySearchResultsProviderElement(super.provider);

  @override
  int get categoryId => (origin as EntitySearchResultsProvider).categoryId;
}

String _$entitySearchQueryNotifierHash() =>
    r'0d5456a00fe5b9f1fd3fbc0d5f4902a58bcf289f';

/// Debounced query notifier for entity search
///
/// Copied from [EntitySearchQueryNotifier].
@ProviderFor(EntitySearchQueryNotifier)
final entitySearchQueryNotifierProvider =
    AutoDisposeNotifierProvider<EntitySearchQueryNotifier, String>.internal(
      EntitySearchQueryNotifier.new,
      name: r'entitySearchQueryNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$entitySearchQueryNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$EntitySearchQueryNotifier = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
