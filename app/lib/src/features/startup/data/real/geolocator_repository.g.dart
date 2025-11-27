// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geolocator_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(geoLocatorRepository)
const geoLocatorRepositoryProvider = GeoLocatorRepositoryProvider._();

final class GeoLocatorRepositoryProvider
    extends
        $FunctionalProvider<
          GeoLocatorRepository,
          GeoLocatorRepository,
          GeoLocatorRepository
        >
    with $Provider<GeoLocatorRepository> {
  const GeoLocatorRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'geoLocatorRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$geoLocatorRepositoryHash();

  @$internal
  @override
  $ProviderElement<GeoLocatorRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GeoLocatorRepository create(Ref ref) {
    return geoLocatorRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GeoLocatorRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GeoLocatorRepository>(value),
    );
  }
}

String _$geoLocatorRepositoryHash() =>
    r'92b541babfcd7df0137d59faf1dd72f494611b23';
