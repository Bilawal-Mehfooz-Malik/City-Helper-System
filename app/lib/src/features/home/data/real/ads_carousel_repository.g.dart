// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_carousel_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(adsCarouselRepository)
const adsCarouselRepositoryProvider = AdsCarouselRepositoryProvider._();

final class AdsCarouselRepositoryProvider
    extends
        $FunctionalProvider<
          AdsCarouselRepository,
          AdsCarouselRepository,
          AdsCarouselRepository
        >
    with $Provider<AdsCarouselRepository> {
  const AdsCarouselRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adsCarouselRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adsCarouselRepositoryHash();

  @$internal
  @override
  $ProviderElement<AdsCarouselRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AdsCarouselRepository create(Ref ref) {
    return adsCarouselRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AdsCarouselRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AdsCarouselRepository>(value),
    );
  }
}

String _$adsCarouselRepositoryHash() =>
    r'f652812c9755afeb62d5d0bcbeff07c72e1eb5f4';

@ProviderFor(carouselAdsListFuture)
const carouselAdsListFutureProvider = CarouselAdsListFutureFamily._();

final class CarouselAdsListFutureProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CarouselAd>>,
          List<CarouselAd>,
          FutureOr<List<CarouselAd>>
        >
    with $FutureModifier<List<CarouselAd>>, $FutureProvider<List<CarouselAd>> {
  const CarouselAdsListFutureProvider._({
    required CarouselAdsListFutureFamily super.from,
    required (CategoryId, {SubCategoryId? subcategoryId}) super.argument,
  }) : super(
         retry: null,
         name: r'carouselAdsListFutureProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$carouselAdsListFutureHash();

  @override
  String toString() {
    return r'carouselAdsListFutureProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<CarouselAd>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CarouselAd>> create(Ref ref) {
    final argument =
        this.argument as (CategoryId, {SubCategoryId? subcategoryId});
    return carouselAdsListFuture(
      ref,
      argument.$1,
      subcategoryId: argument.subcategoryId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CarouselAdsListFutureProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$carouselAdsListFutureHash() =>
    r'da70273e5e8afd84446360de05c81fed970f8dd3';

final class CarouselAdsListFutureFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<CarouselAd>>,
          (CategoryId, {SubCategoryId? subcategoryId})
        > {
  const CarouselAdsListFutureFamily._()
    : super(
        retry: null,
        name: r'carouselAdsListFutureProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CarouselAdsListFutureProvider call(
    CategoryId categoryId, {
    SubCategoryId? subcategoryId,
  }) => CarouselAdsListFutureProvider._(
    argument: (categoryId, subcategoryId: subcategoryId),
    from: this,
  );

  @override
  String toString() => r'carouselAdsListFutureProvider';
}

@ProviderFor(adStream)
const adStreamProvider = AdStreamFamily._();

final class AdStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<CarouselAd?>,
          CarouselAd?,
          Stream<CarouselAd?>
        >
    with $FutureModifier<CarouselAd?>, $StreamProvider<CarouselAd?> {
  const AdStreamProvider._({
    required AdStreamFamily super.from,
    required CarouselAdId super.argument,
  }) : super(
         retry: null,
         name: r'adStreamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$adStreamHash();

  @override
  String toString() {
    return r'adStreamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<CarouselAd?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<CarouselAd?> create(Ref ref) {
    final argument = this.argument as CarouselAdId;
    return adStream(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AdStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$adStreamHash() => r'95e83729e28e2d7e799bbdee395553c1051abbd5';

final class AdStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<CarouselAd?>, CarouselAdId> {
  const AdStreamFamily._()
    : super(
        retry: null,
        name: r'adStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AdStreamProvider call(CarouselAdId adId) =>
      AdStreamProvider._(argument: adId, from: this);

  @override
  String toString() => r'adStreamProvider';
}

@ProviderFor(adFuture)
const adFutureProvider = AdFutureFamily._();

final class AdFutureProvider
    extends
        $FunctionalProvider<
          AsyncValue<CarouselAd?>,
          CarouselAd?,
          FutureOr<CarouselAd?>
        >
    with $FutureModifier<CarouselAd?>, $FutureProvider<CarouselAd?> {
  const AdFutureProvider._({
    required AdFutureFamily super.from,
    required CarouselAdId super.argument,
  }) : super(
         retry: null,
         name: r'adFutureProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$adFutureHash();

  @override
  String toString() {
    return r'adFutureProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CarouselAd?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CarouselAd?> create(Ref ref) {
    final argument = this.argument as CarouselAdId;
    return adFuture(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AdFutureProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$adFutureHash() => r'3573344b18dfee982732d4e7885a41dc7efe1d2c';

final class AdFutureFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<CarouselAd?>, CarouselAdId> {
  const AdFutureFamily._()
    : super(
        retry: null,
        name: r'adFutureProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AdFutureProvider call(CarouselAdId adId) =>
      AdFutureProvider._(argument: adId, from: this);

  @override
  String toString() => r'adFutureProvider';
}

@ProviderFor(finalCarouselAds)
const finalCarouselAdsProvider = FinalCarouselAdsFamily._();

final class FinalCarouselAdsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CarouselAd>>,
          List<CarouselAd>,
          FutureOr<List<CarouselAd>>
        >
    with $FutureModifier<List<CarouselAd>>, $FutureProvider<List<CarouselAd>> {
  const FinalCarouselAdsProvider._({
    required FinalCarouselAdsFamily super.from,
    required (CategoryId, {SubCategoryId? subcategoryId}) super.argument,
  }) : super(
         retry: null,
         name: r'finalCarouselAdsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$finalCarouselAdsHash();

  @override
  String toString() {
    return r'finalCarouselAdsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<CarouselAd>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CarouselAd>> create(Ref ref) {
    final argument =
        this.argument as (CategoryId, {SubCategoryId? subcategoryId});
    return finalCarouselAds(
      ref,
      argument.$1,
      subcategoryId: argument.subcategoryId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FinalCarouselAdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$finalCarouselAdsHash() => r'2ec19d55118c2380d6d8cbf8b46cd64ddc6f84ff';

final class FinalCarouselAdsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<CarouselAd>>,
          (CategoryId, {SubCategoryId? subcategoryId})
        > {
  const FinalCarouselAdsFamily._()
    : super(
        retry: null,
        name: r'finalCarouselAdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  FinalCarouselAdsProvider call(
    CategoryId categoryId, {
    SubCategoryId? subcategoryId,
  }) => FinalCarouselAdsProvider._(
    argument: (categoryId, subcategoryId: subcategoryId),
    from: this,
  );

  @override
  String toString() => r'finalCarouselAdsProvider';
}
