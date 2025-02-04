// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_search_query_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationSearchResultsHash() =>
    r'f3d4a8854c7076924da7ff4d66f1c10c495d4bd8';

/// A provider that returns the search results for the current search query
///
/// Copied from [locationSearchResults].
@ProviderFor(locationSearchResults)
final locationSearchResultsProvider =
    AutoDisposeFutureProvider<List<PlaceSuggestion>?>.internal(
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
typedef LocationSearchResultsRef
    = AutoDisposeFutureProviderRef<List<PlaceSuggestion>?>;
String _$locationSearchQueryNotifierHash() =>
    r'c481a6304b6bea92301029e8803a3c988059f76a';

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
