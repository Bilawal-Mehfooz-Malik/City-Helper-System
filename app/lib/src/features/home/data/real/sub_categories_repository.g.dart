// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_categories_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subCategoriesRepositoryHash() =>
    r'36ace8fac2249698be58058982a6ccc812f0d795';

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
String _$subCategoriesListStreamHash() =>
    r'c4709a411ceadfbda833e99218b6bb2b6fa4d1c6';

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

/// See also [subCategoriesListStream].
@ProviderFor(subCategoriesListStream)
const subCategoriesListStreamProvider = SubCategoriesListStreamFamily();

/// See also [subCategoriesListStream].
class SubCategoriesListStreamFamily
    extends Family<AsyncValue<List<SubCategory>>> {
  /// See also [subCategoriesListStream].
  const SubCategoriesListStreamFamily();

  /// See also [subCategoriesListStream].
  SubCategoriesListStreamProvider call(int id) {
    return SubCategoriesListStreamProvider(id);
  }

  @override
  SubCategoriesListStreamProvider getProviderOverride(
    covariant SubCategoriesListStreamProvider provider,
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
  String? get name => r'subCategoriesListStreamProvider';
}

/// See also [subCategoriesListStream].
class SubCategoriesListStreamProvider
    extends AutoDisposeStreamProvider<List<SubCategory>> {
  /// See also [subCategoriesListStream].
  SubCategoriesListStreamProvider(int id)
    : this._internal(
        (ref) => subCategoriesListStream(ref as SubCategoriesListStreamRef, id),
        from: subCategoriesListStreamProvider,
        name: r'subCategoriesListStreamProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$subCategoriesListStreamHash,
        dependencies: SubCategoriesListStreamFamily._dependencies,
        allTransitiveDependencies:
            SubCategoriesListStreamFamily._allTransitiveDependencies,
        id: id,
      );

  SubCategoriesListStreamProvider._internal(
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
    Stream<List<SubCategory>> Function(SubCategoriesListStreamRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubCategoriesListStreamProvider._internal(
        (ref) => create(ref as SubCategoriesListStreamRef),
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
  AutoDisposeStreamProviderElement<List<SubCategory>> createElement() {
    return _SubCategoriesListStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubCategoriesListStreamProvider && other.id == id;
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
mixin SubCategoriesListStreamRef
    on AutoDisposeStreamProviderRef<List<SubCategory>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SubCategoriesListStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<SubCategory>>
    with SubCategoriesListStreamRef {
  _SubCategoriesListStreamProviderElement(super.provider);

  @override
  int get id => (origin as SubCategoriesListStreamProvider).id;
}

String _$subCategoriesListFutureHash() =>
    r'e4a949cec83e4b6916f3493d7451018acd80c913';

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
    extends AutoDisposeFutureProvider<List<SubCategory>> {
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
  AutoDisposeFutureProviderElement<List<SubCategory>> createElement() {
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
mixin SubCategoriesListFutureRef
    on AutoDisposeFutureProviderRef<List<SubCategory>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SubCategoriesListFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<SubCategory>>
    with SubCategoriesListFutureRef {
  _SubCategoriesListFutureProviderElement(super.provider);

  @override
  int get id => (origin as SubCategoriesListFutureProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
