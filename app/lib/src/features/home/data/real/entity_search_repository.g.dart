// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_search_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$residenceSearchRepositoryHash() =>
    r'0c50909d97ebecb502603f1275f1cc1cf80b7cca';

/// See also [residenceSearchRepository].
@ProviderFor(residenceSearchRepository)
final residenceSearchRepositoryProvider =
    Provider<EntitySearchRepository>.internal(
      residenceSearchRepository,
      name: r'residenceSearchRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$residenceSearchRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ResidenceSearchRepositoryRef = ProviderRef<EntitySearchRepository>;
String _$foodSearchRepositoryHash() =>
    r'c78731f12482d1890d2dea9a67ae150597a67145';

/// See also [foodSearchRepository].
@ProviderFor(foodSearchRepository)
final foodSearchRepositoryProvider = Provider<EntitySearchRepository>.internal(
  foodSearchRepository,
  name: r'foodSearchRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$foodSearchRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FoodSearchRepositoryRef = ProviderRef<EntitySearchRepository>;
String _$searchByCategoryIdHash() =>
    r'6b270049a3db5158355da964632b36d280e3a403';

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

/// See also [searchByCategoryId].
@ProviderFor(searchByCategoryId)
const searchByCategoryIdProvider = SearchByCategoryIdFamily();

/// See also [searchByCategoryId].
class SearchByCategoryIdFamily extends Family<AsyncValue<List<SearchEntity>>> {
  /// See also [searchByCategoryId].
  const SearchByCategoryIdFamily();

  /// See also [searchByCategoryId].
  SearchByCategoryIdProvider call(({int categoryId, String query}) input) {
    return SearchByCategoryIdProvider(input);
  }

  @override
  SearchByCategoryIdProvider getProviderOverride(
    covariant SearchByCategoryIdProvider provider,
  ) {
    return call(provider.input);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchByCategoryIdProvider';
}

/// See also [searchByCategoryId].
class SearchByCategoryIdProvider
    extends AutoDisposeFutureProvider<List<SearchEntity>> {
  /// See also [searchByCategoryId].
  SearchByCategoryIdProvider(({int categoryId, String query}) input)
    : this._internal(
        (ref) => searchByCategoryId(ref as SearchByCategoryIdRef, input),
        from: searchByCategoryIdProvider,
        name: r'searchByCategoryIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$searchByCategoryIdHash,
        dependencies: SearchByCategoryIdFamily._dependencies,
        allTransitiveDependencies:
            SearchByCategoryIdFamily._allTransitiveDependencies,
        input: input,
      );

  SearchByCategoryIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.input,
  }) : super.internal();

  final ({int categoryId, String query}) input;

  @override
  Override overrideWith(
    FutureOr<List<SearchEntity>> Function(SearchByCategoryIdRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchByCategoryIdProvider._internal(
        (ref) => create(ref as SearchByCategoryIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        input: input,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SearchEntity>> createElement() {
    return _SearchByCategoryIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchByCategoryIdProvider && other.input == input;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, input.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchByCategoryIdRef
    on AutoDisposeFutureProviderRef<List<SearchEntity>> {
  /// The parameter `input` of this provider.
  ({int categoryId, String query}) get input;
}

class _SearchByCategoryIdProviderElement
    extends AutoDisposeFutureProviderElement<List<SearchEntity>>
    with SearchByCategoryIdRef {
  _SearchByCategoryIdProviderElement(super.provider);

  @override
  ({int categoryId, String query}) get input =>
      (origin as SearchByCategoryIdProvider).input;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
