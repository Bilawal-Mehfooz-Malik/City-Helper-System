// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_category_view_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedCategoryViewController)
const selectedCategoryViewControllerProvider =
    SelectedCategoryViewControllerProvider._();

final class SelectedCategoryViewControllerProvider
    extends
        $NotifierProvider<
          SelectedCategoryViewController,
          SelectedCategoryView
        > {
  const SelectedCategoryViewControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCategoryViewControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCategoryViewControllerHash();

  @$internal
  @override
  SelectedCategoryViewController create() => SelectedCategoryViewController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SelectedCategoryView value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SelectedCategoryView>(value),
    );
  }
}

String _$selectedCategoryViewControllerHash() =>
    r'd5e8722efe7f0f2dd8698a12195198faf89ee8f7';

abstract class _$SelectedCategoryViewController
    extends $Notifier<SelectedCategoryView> {
  SelectedCategoryView build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SelectedCategoryView, SelectedCategoryView>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SelectedCategoryView, SelectedCategoryView>,
              SelectedCategoryView,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
