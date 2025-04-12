// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userLocationRepositoryHash() =>
    r'55bb60b484cf92713f088c743b0e8916c5956c92';

/// See also [userLocationRepository].
@ProviderFor(userLocationRepository)
final userLocationRepositoryProvider =
    Provider<UserLocationRepository>.internal(
      userLocationRepository,
      name: r'userLocationRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$userLocationRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserLocationRepositoryRef = ProviderRef<UserLocationRepository>;
String _$watchUserLocationHash() => r'd9aa115477e08d64cb47ca70eb5baaf59786bb8d';

/// See also [watchUserLocation].
@ProviderFor(watchUserLocation)
final watchUserLocationProvider = StreamProvider<LatLng?>.internal(
  watchUserLocation,
  name: r'watchUserLocationProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$watchUserLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchUserLocationRef = StreamProviderRef<LatLng?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
