// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FilterController)
const filterControllerProvider = FilterControllerFamily._();

final class FilterControllerProvider
    extends $NotifierProvider<FilterController, EntityFilter> {
  const FilterControllerProvider._({
    required FilterControllerFamily super.from,
    required ({CategoryId categoryId, FilterContext filterContext})
    super.argument,
  }) : super(
         retry: null,
         name: r'filterControllerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filterControllerHash();

  @override
  String toString() {
    return r'filterControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  FilterController create() => FilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EntityFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EntityFilter>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilterControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filterControllerHash() => r'2709e8478d316327ff2beec6273ed2f18abb1d59';

final class FilterControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          FilterController,
          EntityFilter,
          EntityFilter,
          EntityFilter,
          ({CategoryId categoryId, FilterContext filterContext})
        > {
  const FilterControllerFamily._()
    : super(
        retry: null,
        name: r'filterControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  FilterControllerProvider call({
    required CategoryId categoryId,
    required FilterContext filterContext,
  }) => FilterControllerProvider._(
    argument: (categoryId: categoryId, filterContext: filterContext),
    from: this,
  );

  @override
  String toString() => r'filterControllerProvider';
}

abstract class _$FilterController extends $Notifier<EntityFilter> {
  late final _$args =
      ref.$arg as ({CategoryId categoryId, FilterContext filterContext});
  CategoryId get categoryId => _$args.categoryId;
  FilterContext get filterContext => _$args.filterContext;

  EntityFilter build({
    required CategoryId categoryId,
    required FilterContext filterContext,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      categoryId: _$args.categoryId,
      filterContext: _$args.filterContext,
    );
    final ref = this.ref as $Ref<EntityFilter, EntityFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EntityFilter, EntityFilter>,
              EntityFilter,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
