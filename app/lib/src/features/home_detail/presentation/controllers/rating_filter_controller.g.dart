// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_filter_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RatingFilterController)
const ratingFilterControllerProvider = RatingFilterControllerProvider._();

final class RatingFilterControllerProvider
    extends $NotifierProvider<RatingFilterController, int?> {
  const RatingFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ratingFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ratingFilterControllerHash();

  @$internal
  @override
  RatingFilterController create() => RatingFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$ratingFilterControllerHash() =>
    r'49e7831c4d1fc23eac21a60af1adf038f81ca43b';

abstract class _$RatingFilterController extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
