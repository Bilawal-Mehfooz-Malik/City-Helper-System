// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_carousel_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesRepositoryHash() =>
    r'19f231bfe9676a264eee30b5496a0f12e572618c';

/// See also [categoriesRepository].
@ProviderFor(categoriesRepository)
final categoriesRepositoryProvider = Provider<CategoriesRepository>.internal(
  categoriesRepository,
  name: r'categoriesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoriesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoriesRepositoryRef = ProviderRef<CategoriesRepository>;
String _$categoriesListStreamHash() =>
    r'60cb3b0ecb4bae45194e7002e423f81c2f67383e';

/// See also [categoriesListStream].
@ProviderFor(categoriesListStream)
final categoriesListStreamProvider =
    AutoDisposeStreamProvider<List<Category>>.internal(
  categoriesListStream,
  name: r'categoriesListStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoriesListStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoriesListStreamRef = AutoDisposeStreamProviderRef<List<Category>>;
String _$categoriesListFutureHash() =>
    r'4ad55643af4b21d77fc125a5562ac4aaa3c19955';

/// See also [categoriesListFuture].
@ProviderFor(categoriesListFuture)
final categoriesListFutureProvider =
    AutoDisposeFutureProvider<List<Category>>.internal(
  categoriesListFuture,
  name: r'categoriesListFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoriesListFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoriesListFutureRef = AutoDisposeFutureProviderRef<List<Category>>;
String _$categoryStreamHash() => r'5b202f033fadcc53ab3efb06ffd5f67183e5be54';

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

/// See also [categoryStream].
@ProviderFor(categoryStream)
const categoryStreamProvider = CategoryStreamFamily();

/// See also [categoryStream].
class CategoryStreamFamily extends Family<AsyncValue<Category?>> {
  /// See also [categoryStream].
  const CategoryStreamFamily();

  /// See also [categoryStream].
  CategoryStreamProvider call(
    int id,
  ) {
    return CategoryStreamProvider(
      id,
    );
  }

  @override
  CategoryStreamProvider getProviderOverride(
    covariant CategoryStreamProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'categoryStreamProvider';
}

/// See also [categoryStream].
class CategoryStreamProvider extends AutoDisposeStreamProvider<Category?> {
  /// See also [categoryStream].
  CategoryStreamProvider(
    int id,
  ) : this._internal(
          (ref) => categoryStream(
            ref as CategoryStreamRef,
            id,
          ),
          from: categoryStreamProvider,
          name: r'categoryStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryStreamHash,
          dependencies: CategoryStreamFamily._dependencies,
          allTransitiveDependencies:
              CategoryStreamFamily._allTransitiveDependencies,
          id: id,
        );

  CategoryStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    Stream<Category?> Function(CategoryStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryStreamProvider._internal(
        (ref) => create(ref as CategoryStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Category?> createElement() {
    return _CategoryStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryStreamProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CategoryStreamRef on AutoDisposeStreamProviderRef<Category?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CategoryStreamProviderElement
    extends AutoDisposeStreamProviderElement<Category?> with CategoryStreamRef {
  _CategoryStreamProviderElement(super.provider);

  @override
  int get id => (origin as CategoryStreamProvider).id;
}

String _$categoryFutureHash() => r'fbbc9ea10479b80c78e55bb3835778fdf18c4637';

/// See also [categoryFuture].
@ProviderFor(categoryFuture)
const categoryFutureProvider = CategoryFutureFamily();

/// See also [categoryFuture].
class CategoryFutureFamily extends Family<AsyncValue<Category?>> {
  /// See also [categoryFuture].
  const CategoryFutureFamily();

  /// See also [categoryFuture].
  CategoryFutureProvider call(
    int id,
  ) {
    return CategoryFutureProvider(
      id,
    );
  }

  @override
  CategoryFutureProvider getProviderOverride(
    covariant CategoryFutureProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'categoryFutureProvider';
}

/// See also [categoryFuture].
class CategoryFutureProvider extends AutoDisposeFutureProvider<Category?> {
  /// See also [categoryFuture].
  CategoryFutureProvider(
    int id,
  ) : this._internal(
          (ref) => categoryFuture(
            ref as CategoryFutureRef,
            id,
          ),
          from: categoryFutureProvider,
          name: r'categoryFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryFutureHash,
          dependencies: CategoryFutureFamily._dependencies,
          allTransitiveDependencies:
              CategoryFutureFamily._allTransitiveDependencies,
          id: id,
        );

  CategoryFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Category?> Function(CategoryFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryFutureProvider._internal(
        (ref) => create(ref as CategoryFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Category?> createElement() {
    return _CategoryFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CategoryFutureRef on AutoDisposeFutureProviderRef<Category?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CategoryFutureProviderElement
    extends AutoDisposeFutureProviderElement<Category?> with CategoryFutureRef {
  _CategoryFutureProviderElement(super.provider);

  @override
  int get id => (origin as CategoryFutureProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
