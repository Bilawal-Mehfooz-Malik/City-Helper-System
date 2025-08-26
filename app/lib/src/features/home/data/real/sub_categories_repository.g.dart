// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_categories_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subCategoriesRepositoryHash() =>
    r'14f3f2a6ad8c720056b17de322bd147b3d92ce63';

/// See also [subCategoriesRepository].
@ProviderFor(subCategoriesRepository)
final subCategoriesRepositoryProvider =
    Provider<SubCategoriesRepository>.internal(
      subCategoriesRepository,
      name: r'subCategoriesRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$subCategoriesRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SubCategoriesRepositoryRef = ProviderRef<SubCategoriesRepository>;
String _$subCategoriesListFutureHash() =>
    r'3fc7f69de5daf9c71035e362f9f30c339e14b931';

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

/// See also [subCategoriesListFuture].
@ProviderFor(subCategoriesListFuture)
const subCategoriesListFutureProvider = SubCategoriesListFutureFamily();

/// See also [subCategoriesListFuture].
class SubCategoriesListFutureFamily
    extends Family<AsyncValue<List<SubCategory>>> {
  /// See also [subCategoriesListFuture].
  const SubCategoriesListFutureFamily();

  /// See also [subCategoriesListFuture].
  SubCategoriesListFutureProvider call(int id) {
    return SubCategoriesListFutureProvider(id);
  }

  @override
  SubCategoriesListFutureProvider getProviderOverride(
    covariant SubCategoriesListFutureProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'subCategoriesListFutureProvider';
}

/// See also [subCategoriesListFuture].
class SubCategoriesListFutureProvider
    extends FutureProvider<List<SubCategory>> {
  /// See also [subCategoriesListFuture].
  SubCategoriesListFutureProvider(int id)
    : this._internal(
        (ref) => subCategoriesListFuture(ref as SubCategoriesListFutureRef, id),
        from: subCategoriesListFutureProvider,
        name: r'subCategoriesListFutureProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$subCategoriesListFutureHash,
        dependencies: SubCategoriesListFutureFamily._dependencies,
        allTransitiveDependencies:
            SubCategoriesListFutureFamily._allTransitiveDependencies,
        id: id,
      );

  SubCategoriesListFutureProvider._internal(
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
    FutureOr<List<SubCategory>> Function(SubCategoriesListFutureRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubCategoriesListFutureProvider._internal(
        (ref) => create(ref as SubCategoriesListFutureRef),
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
  FutureProviderElement<List<SubCategory>> createElement() {
    return _SubCategoriesListFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubCategoriesListFutureProvider && other.id == id;
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
mixin SubCategoriesListFutureRef on FutureProviderRef<List<SubCategory>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SubCategoriesListFutureProviderElement
    extends FutureProviderElement<List<SubCategory>>
    with SubCategoriesListFutureRef {
  _SubCategoriesListFutureProviderElement(super.provider);

  @override
  int get id => (origin as SubCategoriesListFutureProvider).id;
}

String _$subCategoryFutureHash() => r'f4e0b261a18165e273b07631313663d4ee406af9';

/// See also [subCategoryFuture].
@ProviderFor(subCategoryFuture)
const subCategoryFutureProvider = SubCategoryFutureFamily();

/// See also [subCategoryFuture].
class SubCategoryFutureFamily extends Family<AsyncValue<SubCategory?>> {
  /// See also [subCategoryFuture].
  const SubCategoryFutureFamily();

  /// See also [subCategoryFuture].
  SubCategoryFutureProvider call(int id) {
    return SubCategoryFutureProvider(id);
  }

  @override
  SubCategoryFutureProvider getProviderOverride(
    covariant SubCategoryFutureProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'subCategoryFutureProvider';
}

/// See also [subCategoryFuture].
class SubCategoryFutureProvider extends FutureProvider<SubCategory?> {
  /// See also [subCategoryFuture].
  SubCategoryFutureProvider(int id)
    : this._internal(
        (ref) => subCategoryFuture(ref as SubCategoryFutureRef, id),
        from: subCategoryFutureProvider,
        name: r'subCategoryFutureProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$subCategoryFutureHash,
        dependencies: SubCategoryFutureFamily._dependencies,
        allTransitiveDependencies:
            SubCategoryFutureFamily._allTransitiveDependencies,
        id: id,
      );

  SubCategoryFutureProvider._internal(
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
    FutureOr<SubCategory?> Function(SubCategoryFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubCategoryFutureProvider._internal(
        (ref) => create(ref as SubCategoryFutureRef),
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
  FutureProviderElement<SubCategory?> createElement() {
    return _SubCategoryFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubCategoryFutureProvider && other.id == id;
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
mixin SubCategoryFutureRef on FutureProviderRef<SubCategory?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SubCategoryFutureProviderElement
    extends FutureProviderElement<SubCategory?>
    with SubCategoryFutureRef {
  _SubCategoryFutureProviderElement(super.provider);

  @override
  int get id => (origin as SubCategoryFutureProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
