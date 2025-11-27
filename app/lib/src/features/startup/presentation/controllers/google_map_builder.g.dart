// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_map_builder.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(googleMapBuilder)
const googleMapBuilderProvider = GoogleMapBuilderProvider._();

final class GoogleMapBuilderProvider
    extends
        $FunctionalProvider<
          GoogleMapBuilder,
          GoogleMapBuilder,
          GoogleMapBuilder
        >
    with $Provider<GoogleMapBuilder> {
  const GoogleMapBuilderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleMapBuilderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleMapBuilderHash();

  @$internal
  @override
  $ProviderElement<GoogleMapBuilder> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoogleMapBuilder create(Ref ref) {
    return googleMapBuilder(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoogleMapBuilder value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoogleMapBuilder>(value),
    );
  }
}

String _$googleMapBuilderHash() => r'3118e4989f8a72ea7b729792828eb437e527370e';
