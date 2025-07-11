// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$initialShopCategoryDataHash() =>
    r'f04029d39ea5c5360f3209cf1eba3605351b67c9';

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

/// See also [initialShopCategoryData].
@ProviderFor(initialShopCategoryData)
const initialShopCategoryDataProvider = InitialShopCategoryDataFamily();

/// See also [initialShopCategoryData].
class InitialShopCategoryDataFamily
    extends Family<AsyncValue<ShopFormInitialData>> {
  /// See also [initialShopCategoryData].
  const InitialShopCategoryDataFamily();

  /// See also [initialShopCategoryData].
  InitialShopCategoryDataProvider call({
    required int categoryId,
    required int? subCategoryId,
  }) {
    return InitialShopCategoryDataProvider(
      categoryId: categoryId,
      subCategoryId: subCategoryId,
    );
  }

  @override
  InitialShopCategoryDataProvider getProviderOverride(
    covariant InitialShopCategoryDataProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
      subCategoryId: provider.subCategoryId,
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
  String? get name => r'initialShopCategoryDataProvider';
}

/// See also [initialShopCategoryData].
class InitialShopCategoryDataProvider
    extends AutoDisposeFutureProvider<ShopFormInitialData> {
  /// See also [initialShopCategoryData].
  InitialShopCategoryDataProvider({
    required int categoryId,
    required int? subCategoryId,
  }) : this._internal(
         (ref) => initialShopCategoryData(
           ref as InitialShopCategoryDataRef,
           categoryId: categoryId,
           subCategoryId: subCategoryId,
         ),
         from: initialShopCategoryDataProvider,
         name: r'initialShopCategoryDataProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$initialShopCategoryDataHash,
         dependencies: InitialShopCategoryDataFamily._dependencies,
         allTransitiveDependencies:
             InitialShopCategoryDataFamily._allTransitiveDependencies,
         categoryId: categoryId,
         subCategoryId: subCategoryId,
       );

  InitialShopCategoryDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.subCategoryId,
  }) : super.internal();

  final int categoryId;
  final int? subCategoryId;

  @override
  Override overrideWith(
    FutureOr<ShopFormInitialData> Function(InitialShopCategoryDataRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InitialShopCategoryDataProvider._internal(
        (ref) => create(ref as InitialShopCategoryDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        subCategoryId: subCategoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ShopFormInitialData> createElement() {
    return _InitialShopCategoryDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InitialShopCategoryDataProvider &&
        other.categoryId == categoryId &&
        other.subCategoryId == subCategoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, subCategoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InitialShopCategoryDataRef
    on AutoDisposeFutureProviderRef<ShopFormInitialData> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;

  /// The parameter `subCategoryId` of this provider.
  int? get subCategoryId;
}

class _InitialShopCategoryDataProviderElement
    extends AutoDisposeFutureProviderElement<ShopFormInitialData>
    with InitialShopCategoryDataRef {
  _InitialShopCategoryDataProviderElement(super.provider);

  @override
  int get categoryId => (origin as InitialShopCategoryDataProvider).categoryId;
  @override
  int? get subCategoryId =>
      (origin as InitialShopCategoryDataProvider).subCategoryId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
