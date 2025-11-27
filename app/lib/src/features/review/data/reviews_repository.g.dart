// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reviewsRepository)
const reviewsRepositoryProvider = ReviewsRepositoryProvider._();

final class ReviewsRepositoryProvider
    extends
        $FunctionalProvider<
          ReviewsRepository,
          ReviewsRepository,
          ReviewsRepository
        >
    with $Provider<ReviewsRepository> {
  const ReviewsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reviewsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reviewsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReviewsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReviewsRepository create(Ref ref) {
    return reviewsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReviewsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReviewsRepository>(value),
    );
  }
}

String _$reviewsRepositoryHash() => r'3fb24588000e73703376cd09115a47596b121903';

@ProviderFor(fetchReviewsList)
const fetchReviewsListProvider = FetchReviewsListFamily._();

final class FetchReviewsListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Review>>,
          List<Review>,
          FutureOr<List<Review>>
        >
    with $FutureModifier<List<Review>>, $FutureProvider<List<Review>> {
  const FetchReviewsListProvider._({
    required FetchReviewsListFamily super.from,
    required EntityId super.argument,
  }) : super(
         retry: null,
         name: r'fetchReviewsListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchReviewsListHash();

  @override
  String toString() {
    return r'fetchReviewsListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Review>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Review>> create(Ref ref) {
    final argument = this.argument as EntityId;
    return fetchReviewsList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchReviewsListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchReviewsListHash() => r'30bb63f473fd86802ca37ee35f4cb32af24e1c4c';

final class FetchReviewsListFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Review>>, EntityId> {
  const FetchReviewsListFamily._()
    : super(
        retry: null,
        name: r'fetchReviewsListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchReviewsListProvider call(EntityId entityId) =>
      FetchReviewsListProvider._(argument: entityId, from: this);

  @override
  String toString() => r'fetchReviewsListProvider';
}

@ProviderFor(watchReviewsList)
const watchReviewsListProvider = WatchReviewsListFamily._();

final class WatchReviewsListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Review>>,
          List<Review>,
          Stream<List<Review>>
        >
    with $FutureModifier<List<Review>>, $StreamProvider<List<Review>> {
  const WatchReviewsListProvider._({
    required WatchReviewsListFamily super.from,
    required EntityId super.argument,
  }) : super(
         retry: null,
         name: r'watchReviewsListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$watchReviewsListHash();

  @override
  String toString() {
    return r'watchReviewsListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Review>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Review>> create(Ref ref) {
    final argument = this.argument as EntityId;
    return watchReviewsList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchReviewsListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$watchReviewsListHash() => r'41a913dfc617729377d7182e71bdab2e63cdce27';

final class WatchReviewsListFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Review>>, EntityId> {
  const WatchReviewsListFamily._()
    : super(
        retry: null,
        name: r'watchReviewsListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WatchReviewsListProvider call(EntityId entityId) =>
      WatchReviewsListProvider._(argument: entityId, from: this);

  @override
  String toString() => r'watchReviewsListProvider';
}

@ProviderFor(userReviewFuture)
const userReviewFutureProvider = UserReviewFutureFamily._();

final class UserReviewFutureProvider
    extends $FunctionalProvider<AsyncValue<Review?>, Review?, FutureOr<Review?>>
    with $FutureModifier<Review?>, $FutureProvider<Review?> {
  const UserReviewFutureProvider._({
    required UserReviewFutureFamily super.from,
    required EntityId super.argument,
  }) : super(
         retry: null,
         name: r'userReviewFutureProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userReviewFutureHash();

  @override
  String toString() {
    return r'userReviewFutureProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Review?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Review?> create(Ref ref) {
    final argument = this.argument as EntityId;
    return userReviewFuture(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserReviewFutureProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userReviewFutureHash() => r'ccc1b9a1f2c9964fc044ac7e747ea7b0551a328e';

final class UserReviewFutureFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Review?>, EntityId> {
  const UserReviewFutureFamily._()
    : super(
        retry: null,
        name: r'userReviewFutureProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserReviewFutureProvider call(EntityId entityId) =>
      UserReviewFutureProvider._(argument: entityId, from: this);

  @override
  String toString() => r'userReviewFutureProvider';
}

@ProviderFor(reviewsPreviewList)
const reviewsPreviewListProvider = ReviewsPreviewListFamily._();

final class ReviewsPreviewListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Review>>,
          List<Review>,
          FutureOr<List<Review>>
        >
    with $FutureModifier<List<Review>>, $FutureProvider<List<Review>> {
  const ReviewsPreviewListProvider._({
    required ReviewsPreviewListFamily super.from,
    required EntityId super.argument,
  }) : super(
         retry: null,
         name: r'reviewsPreviewListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reviewsPreviewListHash();

  @override
  String toString() {
    return r'reviewsPreviewListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Review>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Review>> create(Ref ref) {
    final argument = this.argument as EntityId;
    return reviewsPreviewList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ReviewsPreviewListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reviewsPreviewListHash() =>
    r'b0eaaa7e09d43247fae4735a5b3cacfea964d85d';

final class ReviewsPreviewListFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Review>>, EntityId> {
  const ReviewsPreviewListFamily._()
    : super(
        retry: null,
        name: r'reviewsPreviewListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReviewsPreviewListProvider call(EntityId entityId) =>
      ReviewsPreviewListProvider._(argument: entityId, from: this);

  @override
  String toString() => r'reviewsPreviewListProvider';
}
