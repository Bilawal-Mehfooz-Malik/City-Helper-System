// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userLocationRepository)
const userLocationRepositoryProvider = UserLocationRepositoryProvider._();

final class UserLocationRepositoryProvider
    extends
        $FunctionalProvider<
          UserLocationRepository,
          UserLocationRepository,
          UserLocationRepository
        >
    with $Provider<UserLocationRepository> {
  const UserLocationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLocationRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userLocationRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserLocationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserLocationRepository create(Ref ref) {
    return userLocationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserLocationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserLocationRepository>(value),
    );
  }
}

String _$userLocationRepositoryHash() =>
    r'55bb60b484cf92713f088c743b0e8916c5956c92';

@ProviderFor(fetchUserLocation)
const fetchUserLocationProvider = FetchUserLocationProvider._();

final class FetchUserLocationProvider
    extends $FunctionalProvider<AsyncValue<LatLng?>, LatLng?, FutureOr<LatLng?>>
    with $FutureModifier<LatLng?>, $FutureProvider<LatLng?> {
  const FetchUserLocationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchUserLocationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchUserLocationHash();

  @$internal
  @override
  $FutureProviderElement<LatLng?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<LatLng?> create(Ref ref) {
    return fetchUserLocation(ref);
  }
}

String _$fetchUserLocationHash() => r'146a721bdda75174bb769621a2678724a7d697f4';
