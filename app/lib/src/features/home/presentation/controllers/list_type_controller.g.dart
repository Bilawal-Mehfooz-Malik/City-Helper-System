// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_type_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListTypeController)
const listTypeControllerProvider = ListTypeControllerProvider._();

final class ListTypeControllerProvider
    extends $NotifierProvider<ListTypeController, HomeListType> {
  const ListTypeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listTypeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listTypeControllerHash();

  @$internal
  @override
  ListTypeController create() => ListTypeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeListType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeListType>(value),
    );
  }
}

String _$listTypeControllerHash() =>
    r'3d9869bfcf510ce1368b9fb29ac39c8a2a3d82e5';

abstract class _$ListTypeController extends $Notifier<HomeListType> {
  HomeListType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HomeListType, HomeListType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HomeListType, HomeListType>,
              HomeListType,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
