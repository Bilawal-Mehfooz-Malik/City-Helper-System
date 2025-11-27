// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(defaultLocation)
const defaultLocationProvider = DefaultLocationProvider._();

final class DefaultLocationProvider
    extends $FunctionalProvider<LatLng, LatLng, LatLng>
    with $Provider<LatLng> {
  const DefaultLocationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultLocationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultLocationHash();

  @$internal
  @override
  $ProviderElement<LatLng> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LatLng create(Ref ref) {
    return defaultLocation(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LatLng value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LatLng>(value),
    );
  }
}

String _$defaultLocationHash() => r'5c80e9b5e23c36f8e992e42f1f5ab3687076bea7';
