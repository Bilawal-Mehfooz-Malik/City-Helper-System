// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_search_query_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationSearchResultsHash() =>
    r'd08a9d06b220b7d52b3b560772d714d00ba75fe5';

/// A provider that returns the search results for the current search query
///
/// Copied from [locationSearchResults].
@ProviderFor(locationSearchResults)
final locationSearchResultsProvider =
    AutoDisposeFutureProvider<List<Place>?>.internal(
  locationSearchResults,
  name: r'locationSearchResultsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationSearchResultsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationSearchResultsRef = AutoDisposeFutureProviderRef<List<Place>?>;
String _$locationSearchQueryNotifierHash() =>
    r'196ecbba8c7c2ceda5a4d76c6934b9be6cbec456';

/// A simple notifier class to keep track of the search query
///
/// Copied from [LocationSearchQueryNotifier].
@ProviderFor(LocationSearchQueryNotifier)
final locationSearchQueryNotifierProvider =
    AutoDisposeNotifierProvider<LocationSearchQueryNotifier, String>.internal(
  LocationSearchQueryNotifier.new,
  name: r'locationSearchQueryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationSearchQueryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocationSearchQueryNotifier = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
