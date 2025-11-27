// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_form_wizard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShopFormWizardController)
const shopFormWizardControllerProvider = ShopFormWizardControllerFamily._();

final class ShopFormWizardControllerProvider
    extends $NotifierProvider<ShopFormWizardController, ShopFormWizardState> {
  const ShopFormWizardControllerProvider._({
    required ShopFormWizardControllerFamily super.from,
    required ShopForm super.argument,
  }) : super(
         retry: null,
         name: r'shopFormWizardControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$shopFormWizardControllerHash();

  @override
  String toString() {
    return r'shopFormWizardControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ShopFormWizardController create() => ShopFormWizardController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShopFormWizardState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShopFormWizardState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShopFormWizardControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shopFormWizardControllerHash() =>
    r'05bfd52899df731a78ef01ce495d2045e8db1ff6';

final class ShopFormWizardControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ShopFormWizardController,
          ShopFormWizardState,
          ShopFormWizardState,
          ShopFormWizardState,
          ShopForm
        > {
  const ShopFormWizardControllerFamily._()
    : super(
        retry: null,
        name: r'shopFormWizardControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ShopFormWizardControllerProvider call(ShopForm initialFormData) =>
      ShopFormWizardControllerProvider._(argument: initialFormData, from: this);

  @override
  String toString() => r'shopFormWizardControllerProvider';
}

abstract class _$ShopFormWizardController
    extends $Notifier<ShopFormWizardState> {
  late final _$args = ref.$arg as ShopForm;
  ShopForm get initialFormData => _$args;

  ShopFormWizardState build(ShopForm initialFormData);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<ShopFormWizardState, ShopFormWizardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ShopFormWizardState, ShopFormWizardState>,
              ShopFormWizardState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
