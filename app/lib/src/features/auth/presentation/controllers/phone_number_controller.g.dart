// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PhoneNumberController)
const phoneNumberControllerProvider = PhoneNumberControllerProvider._();

final class PhoneNumberControllerProvider
    extends $NotifierProvider<PhoneNumberController, String> {
  const PhoneNumberControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'phoneNumberControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$phoneNumberControllerHash();

  @$internal
  @override
  PhoneNumberController create() => PhoneNumberController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$phoneNumberControllerHash() =>
    r'744c3f6e1ff1eb323b7fa2ac6fdf1f654c5463d1';

abstract class _$PhoneNumberController extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
