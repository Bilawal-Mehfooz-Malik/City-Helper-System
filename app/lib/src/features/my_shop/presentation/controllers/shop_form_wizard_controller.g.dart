// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_form_wizard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shopFormWizardControllerHash() =>
    r'9233a5928baa5e786dbbd41bf2de8fe7e909e4af';

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

abstract class _$ShopFormWizardController
    extends BuildlessAutoDisposeNotifier<ShopFormWizardState> {
  late final ShopForm initialFormData;

  ShopFormWizardState build(ShopForm initialFormData);
}

/// See also [ShopFormWizardController].
@ProviderFor(ShopFormWizardController)
const shopFormWizardControllerProvider = ShopFormWizardControllerFamily();

/// See also [ShopFormWizardController].
class ShopFormWizardControllerFamily extends Family<ShopFormWizardState> {
  /// See also [ShopFormWizardController].
  const ShopFormWizardControllerFamily();

  /// See also [ShopFormWizardController].
  ShopFormWizardControllerProvider call(ShopForm initialFormData) {
    return ShopFormWizardControllerProvider(initialFormData);
  }

  @override
  ShopFormWizardControllerProvider getProviderOverride(
    covariant ShopFormWizardControllerProvider provider,
  ) {
    return call(provider.initialFormData);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'shopFormWizardControllerProvider';
}

/// See also [ShopFormWizardController].
class ShopFormWizardControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          ShopFormWizardController,
          ShopFormWizardState
        > {
  /// See also [ShopFormWizardController].
  ShopFormWizardControllerProvider(ShopForm initialFormData)
    : this._internal(
        () => ShopFormWizardController()..initialFormData = initialFormData,
        from: shopFormWizardControllerProvider,
        name: r'shopFormWizardControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$shopFormWizardControllerHash,
        dependencies: ShopFormWizardControllerFamily._dependencies,
        allTransitiveDependencies:
            ShopFormWizardControllerFamily._allTransitiveDependencies,
        initialFormData: initialFormData,
      );

  ShopFormWizardControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialFormData,
  }) : super.internal();

  final ShopForm initialFormData;

  @override
  ShopFormWizardState runNotifierBuild(
    covariant ShopFormWizardController notifier,
  ) {
    return notifier.build(initialFormData);
  }

  @override
  Override overrideWith(ShopFormWizardController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ShopFormWizardControllerProvider._internal(
        () => create()..initialFormData = initialFormData,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialFormData: initialFormData,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    ShopFormWizardController,
    ShopFormWizardState
  >
  createElement() {
    return _ShopFormWizardControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShopFormWizardControllerProvider &&
        other.initialFormData == initialFormData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialFormData.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShopFormWizardControllerRef
    on AutoDisposeNotifierProviderRef<ShopFormWizardState> {
  /// The parameter `initialFormData` of this provider.
  ShopForm get initialFormData;
}

class _ShopFormWizardControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          ShopFormWizardController,
          ShopFormWizardState
        >
    with ShopFormWizardControllerRef {
  _ShopFormWizardControllerProviderElement(super.provider);

  @override
  ShopForm get initialFormData =>
      (origin as ShopFormWizardControllerProvider).initialFormData;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
