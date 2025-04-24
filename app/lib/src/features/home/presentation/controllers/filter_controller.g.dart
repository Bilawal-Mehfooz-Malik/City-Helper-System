// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filterControllerHash() => r'f2ebc737454d9a78e8e5db7102c2160136ccf90f';

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

abstract class _$FilterController extends BuildlessNotifier<EntityFilter> {
  late final int category;

  EntityFilter build({required int category});
}

/// See also [FilterController].
@ProviderFor(FilterController)
const filterControllerProvider = FilterControllerFamily();

/// See also [FilterController].
class FilterControllerFamily extends Family<EntityFilter> {
  /// See also [FilterController].
  const FilterControllerFamily();

  /// See also [FilterController].
  FilterControllerProvider call({required int category}) {
    return FilterControllerProvider(category: category);
  }

  @override
  FilterControllerProvider getProviderOverride(
    covariant FilterControllerProvider provider,
  ) {
    return call(category: provider.category);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filterControllerProvider';
}

/// See also [FilterController].
class FilterControllerProvider
    extends NotifierProviderImpl<FilterController, EntityFilter> {
  /// See also [FilterController].
  FilterControllerProvider({required int category})
    : this._internal(
        () => FilterController()..category = category,
        from: filterControllerProvider,
        name: r'filterControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$filterControllerHash,
        dependencies: FilterControllerFamily._dependencies,
        allTransitiveDependencies:
            FilterControllerFamily._allTransitiveDependencies,
        category: category,
      );

  FilterControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final int category;

  @override
  EntityFilter runNotifierBuild(covariant FilterController notifier) {
    return notifier.build(category: category);
  }

  @override
  Override overrideWith(FilterController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilterControllerProvider._internal(
        () => create()..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  NotifierProviderElement<FilterController, EntityFilter> createElement() {
    return _FilterControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilterControllerProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilterControllerRef on NotifierProviderRef<EntityFilter> {
  /// The parameter `category` of this provider.
  int get category;
}

class _FilterControllerProviderElement
    extends NotifierProviderElement<FilterController, EntityFilter>
    with FilterControllerRef {
  _FilterControllerProviderElement(super.provider);

  @override
  int get category => (origin as FilterControllerProvider).category;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
