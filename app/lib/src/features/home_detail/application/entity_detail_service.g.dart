// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_detail_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(entityDetailsService)
const entityDetailsServiceProvider = EntityDetailsServiceProvider._();

final class EntityDetailsServiceProvider
    extends
        $FunctionalProvider<
          EntityDetailsService,
          EntityDetailsService,
          EntityDetailsService
        >
    with $Provider<EntityDetailsService> {
  const EntityDetailsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'entityDetailsServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$entityDetailsServiceHash();

  @$internal
  @override
  $ProviderElement<EntityDetailsService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EntityDetailsService create(Ref ref) {
    return entityDetailsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EntityDetailsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EntityDetailsService>(value),
    );
  }
}

String _$entityDetailsServiceHash() =>
    r'3775a44bb75763598a69d209d445ed7ceeb483d3';

@ProviderFor(fetchEntityDetails)
const fetchEntityDetailsProvider = FetchEntityDetailsFamily._();

final class FetchEntityDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<EntityDetail?>,
          EntityDetail?,
          FutureOr<EntityDetail?>
        >
    with $FutureModifier<EntityDetail?>, $FutureProvider<EntityDetail?> {
  const FetchEntityDetailsProvider._({
    required FetchEntityDetailsFamily super.from,
    required (CategoryId, EntityId) super.argument,
  }) : super(
         retry: null,
         name: r'fetchEntityDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchEntityDetailsHash();

  @override
  String toString() {
    return r'fetchEntityDetailsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<EntityDetail?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EntityDetail?> create(Ref ref) {
    final argument = this.argument as (CategoryId, EntityId);
    return fetchEntityDetails(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEntityDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchEntityDetailsHash() =>
    r'1e2130e764c386478b7cb673352e3ce4a885ec38';

final class FetchEntityDetailsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<EntityDetail?>,
          (CategoryId, EntityId)
        > {
  const FetchEntityDetailsFamily._()
    : super(
        retry: null,
        name: r'fetchEntityDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchEntityDetailsProvider call(CategoryId categoryId, EntityId entityId) =>
      FetchEntityDetailsProvider._(
        argument: (categoryId, entityId),
        from: this,
      );

  @override
  String toString() => r'fetchEntityDetailsProvider';
}

/// Combines entity detail and reviews into one fetch

@ProviderFor(fetchEntityWithReviews)
const fetchEntityWithReviewsProvider = FetchEntityWithReviewsFamily._();

/// Combines entity detail and reviews into one fetch

final class FetchEntityWithReviewsProvider
    extends
        $FunctionalProvider<
          AsyncValue<(EntityDetail?, List<Review>, bool)>,
          (EntityDetail?, List<Review>, bool),
          FutureOr<(EntityDetail?, List<Review>, bool)>
        >
    with
        $FutureModifier<(EntityDetail?, List<Review>, bool)>,
        $FutureProvider<(EntityDetail?, List<Review>, bool)> {
  /// Combines entity detail and reviews into one fetch
  const FetchEntityWithReviewsProvider._({
    required FetchEntityWithReviewsFamily super.from,
    required (CategoryId, EntityId) super.argument,
  }) : super(
         retry: null,
         name: r'fetchEntityWithReviewsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchEntityWithReviewsHash();

  @override
  String toString() {
    return r'fetchEntityWithReviewsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<(EntityDetail?, List<Review>, bool)> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<(EntityDetail?, List<Review>, bool)> create(Ref ref) {
    final argument = this.argument as (CategoryId, EntityId);
    return fetchEntityWithReviews(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEntityWithReviewsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchEntityWithReviewsHash() =>
    r'bb18cc857fa1ba29808872c409c9106fee42d47f';

/// Combines entity detail and reviews into one fetch

final class FetchEntityWithReviewsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<(EntityDetail?, List<Review>, bool)>,
          (CategoryId, EntityId)
        > {
  const FetchEntityWithReviewsFamily._()
    : super(
        retry: null,
        name: r'fetchEntityWithReviewsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Combines entity detail and reviews into one fetch

  FetchEntityWithReviewsProvider call((CategoryId, EntityId) args) =>
      FetchEntityWithReviewsProvider._(argument: args, from: this);

  @override
  String toString() => r'fetchEntityWithReviewsProvider';
}
