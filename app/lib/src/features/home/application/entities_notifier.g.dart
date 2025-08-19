// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$entitiesNotifierHash() => r'41d50b2fa083c846b19bc3ab94afbd7c9c50e584';

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

abstract class _$EntitiesNotifier
    extends BuildlessNotifier<EntitiesPaginatedState> {
  late final int categoryId;

  EntitiesPaginatedState build(int categoryId);
}

/// See also [EntitiesNotifier].
@ProviderFor(EntitiesNotifier)
const entitiesNotifierProvider = EntitiesNotifierFamily();

/// See also [EntitiesNotifier].
class EntitiesNotifierFamily extends Family<EntitiesPaginatedState> {
  /// See also [EntitiesNotifier].
  const EntitiesNotifierFamily();

  /// See also [EntitiesNotifier].
  EntitiesNotifierProvider call(int categoryId) {
    return EntitiesNotifierProvider(categoryId);
  }

  @override
  EntitiesNotifierProvider getProviderOverride(
    covariant EntitiesNotifierProvider provider,
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
  String? get name => r'entitiesNotifierProvider';
}

/// See also [EntitiesNotifier].
class EntitiesNotifierProvider
    extends NotifierProviderImpl<EntitiesNotifier, EntitiesPaginatedState> {
  /// See also [EntitiesNotifier].
  EntitiesNotifierProvider(int categoryId)
    : this._internal(
        () => EntitiesNotifier()..categoryId = categoryId,
        from: entitiesNotifierProvider,
        name: r'entitiesNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$entitiesNotifierHash,
        dependencies: EntitiesNotifierFamily._dependencies,
        allTransitiveDependencies:
            EntitiesNotifierFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  EntitiesNotifierProvider._internal(
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
  EntitiesPaginatedState runNotifierBuild(covariant EntitiesNotifier notifier) {
    return notifier.build(categoryId);
  }

  @override
  Override overrideWith(EntitiesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: EntitiesNotifierProvider._internal(
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
  NotifierProviderElement<EntitiesNotifier, EntitiesPaginatedState>
  createElement() {
    return _EntitiesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EntitiesNotifierProvider && other.categoryId == categoryId;
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
mixin EntitiesNotifierRef on NotifierProviderRef<EntitiesPaginatedState> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;
}

class _EntitiesNotifierProviderElement
    extends NotifierProviderElement<EntitiesNotifier, EntitiesPaginatedState>
    with EntitiesNotifierRef {
  _EntitiesNotifierProviderElement(super.provider);

  @override
  int get categoryId => (origin as EntitiesNotifierProvider).categoryId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
