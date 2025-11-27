// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_sort_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReviewSortController)
const reviewSortControllerProvider = ReviewSortControllerProvider._();

final class ReviewSortControllerProvider
    extends $NotifierProvider<ReviewSortController, ReviewSortOption> {
  const ReviewSortControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reviewSortControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reviewSortControllerHash();

  @$internal
  @override
  ReviewSortController create() => ReviewSortController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReviewSortOption value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReviewSortOption>(value),
    );
  }
}

String _$reviewSortControllerHash() =>
    r'cbc39b8cabb533cf3c6fbfac0aa3c079ac92d3a1';

abstract class _$ReviewSortController extends $Notifier<ReviewSortOption> {
  ReviewSortOption build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ReviewSortOption, ReviewSortOption>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReviewSortOption, ReviewSortOption>,
              ReviewSortOption,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
