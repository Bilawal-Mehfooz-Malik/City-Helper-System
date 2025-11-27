// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_detail_view_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PopularDetailViewController)
const popularDetailViewControllerProvider =
    PopularDetailViewControllerProvider._();

final class PopularDetailViewControllerProvider
    extends $NotifierProvider<PopularDetailViewController, bool> {
  const PopularDetailViewControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'popularDetailViewControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$popularDetailViewControllerHash();

  @$internal
  @override
  PopularDetailViewController create() => PopularDetailViewController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$popularDetailViewControllerHash() =>
    r'b566dc45136b3847f6f615369bc9b9a733633320';

abstract class _$PopularDetailViewController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
