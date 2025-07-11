// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_form_content_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shopFormContentControllerHash() =>
    r'1956254b4b9aa546f6f3a74d935166125fb4de54';

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

abstract class _$ShopFormContentController
    extends BuildlessAutoDisposeNotifier<ShopForm> {
  late final EntityDetail? initialShop;
  late final ShopFormInitialData? initialData;

  ShopForm build({
    required EntityDetail? initialShop,
    required ShopFormInitialData? initialData,
  });
}

/// See also [ShopFormContentController].
@ProviderFor(ShopFormContentController)
const shopFormContentControllerProvider = ShopFormContentControllerFamily();

/// See also [ShopFormContentController].
class ShopFormContentControllerFamily extends Family<ShopForm> {
  /// See also [ShopFormContentController].
  const ShopFormContentControllerFamily();

  /// See also [ShopFormContentController].
  ShopFormContentControllerProvider call({
    required EntityDetail? initialShop,
    required ShopFormInitialData? initialData,
  }) {
    return ShopFormContentControllerProvider(
      initialShop: initialShop,
      initialData: initialData,
    );
  }

  @override
  ShopFormContentControllerProvider getProviderOverride(
    covariant ShopFormContentControllerProvider provider,
  ) {
    return call(
      initialShop: provider.initialShop,
      initialData: provider.initialData,
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
  String? get name => r'shopFormContentControllerProvider';
}

/// See also [ShopFormContentController].
class ShopFormContentControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<ShopFormContentController, ShopForm> {
  /// See also [ShopFormContentController].
  ShopFormContentControllerProvider({
    required EntityDetail? initialShop,
    required ShopFormInitialData? initialData,
  }) : this._internal(
         () =>
             ShopFormContentController()
               ..initialShop = initialShop
               ..initialData = initialData,
         from: shopFormContentControllerProvider,
         name: r'shopFormContentControllerProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$shopFormContentControllerHash,
         dependencies: ShopFormContentControllerFamily._dependencies,
         allTransitiveDependencies:
             ShopFormContentControllerFamily._allTransitiveDependencies,
         initialShop: initialShop,
         initialData: initialData,
       );

  ShopFormContentControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialShop,
    required this.initialData,
  }) : super.internal();

  final EntityDetail? initialShop;
  final ShopFormInitialData? initialData;

  @override
  ShopForm runNotifierBuild(covariant ShopFormContentController notifier) {
    return notifier.build(initialShop: initialShop, initialData: initialData);
  }

  @override
  Override overrideWith(ShopFormContentController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ShopFormContentControllerProvider._internal(
        () =>
            create()
              ..initialShop = initialShop
              ..initialData = initialData,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialShop: initialShop,
        initialData: initialData,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ShopFormContentController, ShopForm>
  createElement() {
    return _ShopFormContentControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShopFormContentControllerProvider &&
        other.initialShop == initialShop &&
        other.initialData == initialData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialShop.hashCode);
    hash = _SystemHash.combine(hash, initialData.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShopFormContentControllerRef on AutoDisposeNotifierProviderRef<ShopForm> {
  /// The parameter `initialShop` of this provider.
  EntityDetail? get initialShop;

  /// The parameter `initialData` of this provider.
  ShopFormInitialData? get initialData;
}

class _ShopFormContentControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<ShopFormContentController, ShopForm>
    with ShopFormContentControllerRef {
  _ShopFormContentControllerProviderElement(super.provider);

  @override
  EntityDetail? get initialShop =>
      (origin as ShopFormContentControllerProvider).initialShop;
  @override
  ShopFormInitialData? get initialData =>
      (origin as ShopFormContentControllerProvider).initialData;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
