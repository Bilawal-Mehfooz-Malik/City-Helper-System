// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EntitiesNotifier)
const entitiesProvider = EntitiesNotifierFamily._();

final class EntitiesNotifierProvider
    extends $NotifierProvider<EntitiesNotifier, EntitiesPaginatedState> {
  const EntitiesNotifierProvider._({
    required EntitiesNotifierFamily super.from,
    required CategoryId super.argument,
  }) : super(
         retry: null,
         name: r'entitiesProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$entitiesNotifierHash();

  @override
  String toString() {
    return r'entitiesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EntitiesNotifier create() => EntitiesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EntitiesPaginatedState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EntitiesPaginatedState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EntitiesNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$entitiesNotifierHash() => r'2ffdcbccb48b2cb4b2fa41ebe6eb9f593419559a';

final class EntitiesNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          EntitiesNotifier,
          EntitiesPaginatedState,
          EntitiesPaginatedState,
          EntitiesPaginatedState,
          CategoryId
        > {
  const EntitiesNotifierFamily._()
    : super(
        retry: null,
        name: r'entitiesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  EntitiesNotifierProvider call(CategoryId categoryId) =>
      EntitiesNotifierProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'entitiesProvider';
}

abstract class _$EntitiesNotifier extends $Notifier<EntitiesPaginatedState> {
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
