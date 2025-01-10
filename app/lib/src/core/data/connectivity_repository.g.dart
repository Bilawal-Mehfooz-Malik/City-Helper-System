// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectivityRepositoryHash() =>
    r'00c09f4b49cc9d53890f191128d234922f883e5b';

/// See also [connectivityRepository].
@ProviderFor(connectivityRepository)
final connectivityRepositoryProvider =
    AutoDisposeProvider<ConnectivityRepository>.internal(
  connectivityRepository,
  name: r'connectivityRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConnectivityRepositoryRef
    = AutoDisposeProviderRef<ConnectivityRepository>;
String _$internetStatusHash() => r'db10579070709b9f76a34d9c3ee6dddc0fcb4923';

/// See also [internetStatus].
@ProviderFor(internetStatus)
final internetStatusProvider = AutoDisposeStreamProvider<bool>.internal(
  internetStatus,
  name: r'internetStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$internetStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InternetStatusRef = AutoDisposeStreamProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
