// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filterControllerHash() => r'c47982d14d5a05cd2fb97814bf8e408a674f4678';

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
  late final int categoryId;
  late final FilterContext filterContext;

  EntityFilter build({
    required int categoryId,
    required FilterContext filterContext,
  });
}

/// See also [FilterController].
@ProviderFor(FilterController)
const filterControllerProvider = FilterControllerFamily();

/// See also [FilterController].
class FilterControllerFamily extends Family<EntityFilter> {
  /// See also [FilterController].
  const FilterControllerFamily();

  /// See also [FilterController].
  FilterControllerProvider call({
    required int categoryId,
    required FilterContext filterContext,
  }) {
    return FilterControllerProvider(
      categoryId: categoryId,
      filterContext: filterContext,
    );
  }

  @override
  FilterControllerProvider getProviderOverride(
    covariant FilterControllerProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
      filterContext: provider.filterContext,
    );
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
  FilterControllerProvider({
    required int categoryId,
    required FilterContext filterContext,
  }) : this._internal(
         () => FilterController()
           ..categoryId = categoryId
           ..filterContext = filterContext,
         from: filterControllerProvider,
         name: r'filterControllerProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$filterControllerHash,
         dependencies: FilterControllerFamily._dependencies,
         allTransitiveDependencies:
             FilterControllerFamily._allTransitiveDependencies,
         categoryId: categoryId,
         filterContext: filterContext,
       );

  FilterControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.filterContext,
  }) : super.internal();

  final int categoryId;
  final FilterContext filterContext;

  @override
  EntityFilter runNotifierBuild(covariant FilterController notifier) {
    return notifier.build(categoryId: categoryId, filterContext: filterContext);
  }

  @override
  Override overrideWith(FilterController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilterControllerProvider._internal(
        () => create()
          ..categoryId = categoryId
          ..filterContext = filterContext,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        filterContext: filterContext,
      ),
    );
  }

  @override
  NotifierProviderElement<FilterController, EntityFilter> createElement() {
    return _FilterControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilterControllerProvider &&
        other.categoryId == categoryId &&
        other.filterContext == filterContext;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, filterContext.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilterControllerRef on NotifierProviderRef<EntityFilter> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;

  /// The parameter `filterContext` of this provider.
  FilterContext get filterContext;
}

class _FilterControllerProviderElement
    extends NotifierProviderElement<FilterController, EntityFilter>
    with FilterControllerRef {
  _FilterControllerProviderElement(super.provider);

  @override
  int get categoryId => (origin as FilterControllerProvider).categoryId;
  @override
  FilterContext get filterContext =>
      (origin as FilterControllerProvider).filterContext;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
