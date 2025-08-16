// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_entities_paginated_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$popularEntitiesNotifierHash() =>
    r'4c2af23af624c65700d46ae317291dc208296262';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PopularEntitiesNotifier
    extends BuildlessNotifier<PopularEntitiesPaginatedState> {
  late final int categoryId;

  PopularEntitiesPaginatedState build(int categoryId);
}

/// See also [PopularEntitiesNotifier].
@ProviderFor(PopularEntitiesNotifier)
const popularEntitiesNotifierProvider = PopularEntitiesNotifierFamily();

/// See also [PopularEntitiesNotifier].
class PopularEntitiesNotifierFamily
    extends Family<PopularEntitiesPaginatedState> {
  /// See also [PopularEntitiesNotifier].
  const PopularEntitiesNotifierFamily();

  /// See also [PopularEntitiesNotifier].
  PopularEntitiesNotifierProvider call(int categoryId) {
    return PopularEntitiesNotifierProvider(categoryId);
  }

  @override
  PopularEntitiesNotifierProvider getProviderOverride(
    covariant PopularEntitiesNotifierProvider provider,
  ) {
    return call(provider.categoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'popularEntitiesNotifierProvider';
}

/// See also [PopularEntitiesNotifier].
class PopularEntitiesNotifierProvider
    extends
        NotifierProviderImpl<
          PopularEntitiesNotifier,
          PopularEntitiesPaginatedState
        > {
  /// See also [PopularEntitiesNotifier].
  PopularEntitiesNotifierProvider(int categoryId)
    : this._internal(
        () => PopularEntitiesNotifier()..categoryId = categoryId,
        from: popularEntitiesNotifierProvider,
        name: r'popularEntitiesNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$popularEntitiesNotifierHash,
        dependencies: PopularEntitiesNotifierFamily._dependencies,
        allTransitiveDependencies:
            PopularEntitiesNotifierFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  PopularEntitiesNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final int categoryId;

  @override
  PopularEntitiesPaginatedState runNotifierBuild(
    covariant PopularEntitiesNotifier notifier,
  ) {
    return notifier.build(categoryId);
  }

  @override
  Override overrideWith(PopularEntitiesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PopularEntitiesNotifierProvider._internal(
        () => create()..categoryId = categoryId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  NotifierProviderElement<
    PopularEntitiesNotifier,
    PopularEntitiesPaginatedState
  >
  createElement() {
    return _PopularEntitiesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PopularEntitiesNotifierProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PopularEntitiesNotifierRef
    on NotifierProviderRef<PopularEntitiesPaginatedState> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;
}

class _PopularEntitiesNotifierProviderElement
    extends
        NotifierProviderElement<
          PopularEntitiesNotifier,
          PopularEntitiesPaginatedState
        >
    with PopularEntitiesNotifierRef {
  _PopularEntitiesNotifierProviderElement(super.provider);

  @override
  int get categoryId => (origin as PopularEntitiesNotifierProvider).categoryId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
