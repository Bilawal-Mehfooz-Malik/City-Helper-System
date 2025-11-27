// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reviewsService)
const reviewsServiceProvider = ReviewsServiceProvider._();

final class ReviewsServiceProvider
    extends $FunctionalProvider<ReviewsService, ReviewsService, ReviewsService>
    with $Provider<ReviewsService> {
  const ReviewsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reviewsServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reviewsServiceHash();

  @$internal
  @override
  $ProviderElement<ReviewsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReviewsService create(Ref ref) {
    return reviewsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReviewsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReviewsService>(value),
    );
  }
}

String _$reviewsServiceHash() => r'5978f80723f9549750dc8c990b769ce52a61d619';
