// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_category_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedCategoryNotifier)
const selectedCategoryProvider = SelectedCategoryNotifierProvider._();

final class SelectedCategoryNotifierProvider
    extends $NotifierProvider<SelectedCategoryNotifier, CategoryId?> {
  const SelectedCategoryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCategoryNotifierHash();

  @$internal
  @override
  SelectedCategoryNotifier create() => SelectedCategoryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryId? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryId?>(value),
    );
  }
}

String _$selectedCategoryNotifierHash() =>
    r'341ac085061981d698418a22ba1adf00a13c9f30';

abstract class _$SelectedCategoryNotifier extends $Notifier<CategoryId?> {
  CategoryId? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CategoryId?, CategoryId?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CategoryId?, CategoryId?>,
              CategoryId?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
