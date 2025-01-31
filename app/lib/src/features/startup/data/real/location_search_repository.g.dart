// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_search_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationSearchRepositoryHash() =>
    r'a7614558ef24e68847a4a91450fab0fff393c4e9';

/// See also [locationSearchRepository].
@ProviderFor(locationSearchRepository)
final locationSearchRepositoryProvider =
    AutoDisposeProvider<LocationSearchRepository>.internal(
  locationSearchRepository,
  name: r'locationSearchRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationSearchRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationSearchRepositoryRef
    = AutoDisposeProviderRef<LocationSearchRepository>;
String _$locationListSearchHash() =>
    r'6eebdfba19f8373d4bc131ff53c56acb97b6cfd5';

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

/// See also [locationListSearch].
@ProviderFor(locationListSearch)
const locationListSearchProvider = LocationListSearchFamily();

/// See also [locationListSearch].
class LocationListSearchFamily
    extends Family<AsyncValue<List<PlaceSuggestion>?>> {
  /// See also [locationListSearch].
  const LocationListSearchFamily();

  /// See also [locationListSearch].
  LocationListSearchProvider call(
    String query,
  ) {
    return LocationListSearchProvider(
      query,
    );
  }

  @override
  LocationListSearchProvider getProviderOverride(
    covariant LocationListSearchProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'locationListSearchProvider';
}

/// See also [locationListSearch].
class LocationListSearchProvider
    extends AutoDisposeFutureProvider<List<PlaceSuggestion>?> {
  /// See also [locationListSearch].
  LocationListSearchProvider(
    String query,
  ) : this._internal(
          (ref) => locationListSearch(
            ref as LocationListSearchRef,
            query,
          ),
          from: locationListSearchProvider,
          name: r'locationListSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locationListSearchHash,
          dependencies: LocationListSearchFamily._dependencies,
          allTransitiveDependencies:
              LocationListSearchFamily._allTransitiveDependencies,
          query: query,
        );

  LocationListSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<PlaceSuggestion>?> Function(LocationListSearchRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocationListSearchProvider._internal(
        (ref) => create(ref as LocationListSearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PlaceSuggestion>?> createElement() {
    return _LocationListSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocationListSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LocationListSearchRef
    on AutoDisposeFutureProviderRef<List<PlaceSuggestion>?> {
  /// The parameter `query` of this provider.
  String get query;
}

class _LocationListSearchProviderElement
    extends AutoDisposeFutureProviderElement<List<PlaceSuggestion>?>
    with LocationListSearchRef {
  _LocationListSearchProviderElement(super.provider);

  @override
  String get query => (origin as LocationListSearchProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
