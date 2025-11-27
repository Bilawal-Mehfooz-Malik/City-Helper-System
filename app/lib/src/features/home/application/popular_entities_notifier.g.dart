// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_entities_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PopularEntitiesNotifier)
const popularEntitiesProvider = PopularEntitiesNotifierFamily._();

final class PopularEntitiesNotifierProvider
    extends $NotifierProvider<PopularEntitiesNotifier, EntitiesPaginatedState> {
  const PopularEntitiesNotifierProvider._({
    required PopularEntitiesNotifierFamily super.from,
    required CategoryId super.argument,
  }) : super(
         retry: null,
         name: r'popularEntitiesProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$popularEntitiesNotifierHash();

  @override
  String toString() {
    return r'popularEntitiesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PopularEntitiesNotifier create() => PopularEntitiesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EntitiesPaginatedState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EntitiesPaginatedState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PopularEntitiesNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$popularEntitiesNotifierHash() =>
    r'f97d346c918249ba5858e3a68775e1126d3db88d';

final class PopularEntitiesNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PopularEntitiesNotifier,
          EntitiesPaginatedState,
          EntitiesPaginatedState,
          EntitiesPaginatedState,
          CategoryId
        > {
  const PopularEntitiesNotifierFamily._()
    : super(
        retry: null,
        name: r'popularEntitiesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  PopularEntitiesNotifierProvider call(CategoryId categoryId) =>
      PopularEntitiesNotifierProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'popularEntitiesProvider';
}

abstract class _$PopularEntitiesNotifier
    extends $Notifier<EntitiesPaginatedState> {
  late final _$args = ref.$arg as CategoryId;
  CategoryId get categoryId => _$args;

  EntitiesPaginatedState build(CategoryId categoryId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<EntitiesPaginatedState, EntitiesPaginatedState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EntitiesPaginatedState, EntitiesPaginatedState>,
              EntitiesPaginatedState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
