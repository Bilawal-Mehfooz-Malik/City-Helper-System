// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubcategoryController)
const subcategoryControllerProvider = SubcategoryControllerProvider._();

final class SubcategoryControllerProvider
    extends $NotifierProvider<SubcategoryController, SubCategoryId?> {
  const SubcategoryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subcategoryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subcategoryControllerHash();

  @$internal
  @override
  SubcategoryController create() => SubcategoryController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubCategoryId? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubCategoryId?>(value),
    );
  }
}

String _$subcategoryControllerHash() =>
    r'759f903b0efb67ff97aea720481038d4984ce325';

abstract class _$SubcategoryController extends $Notifier<SubCategoryId?> {
  SubCategoryId? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SubCategoryId?, SubCategoryId?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SubCategoryId?, SubCategoryId?>,
              SubCategoryId?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
