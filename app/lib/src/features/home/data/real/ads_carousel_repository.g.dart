// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_carousel_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adsCarouselRepositoryHash() =>
    r'f652812c9755afeb62d5d0bcbeff07c72e1eb5f4';

/// See also [adsCarouselRepository].
@ProviderFor(adsCarouselRepository)
final adsCarouselRepositoryProvider = Provider<AdsCarouselRepository>.internal(
  adsCarouselRepository,
  name: r'adsCarouselRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$adsCarouselRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AdsCarouselRepositoryRef = ProviderRef<AdsCarouselRepository>;
String _$carouselAdsListFutureHash() =>
    r'da70273e5e8afd84446360de05c81fed970f8dd3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [carouselAdsListFuture].
@ProviderFor(carouselAdsListFuture)
const carouselAdsListFutureProvider = CarouselAdsListFutureFamily();

/// See also [carouselAdsListFuture].
class CarouselAdsListFutureFamily extends Family<AsyncValue<List<CarouselAd>>> {
  /// See also [carouselAdsListFuture].
  const CarouselAdsListFutureFamily();

  /// See also [carouselAdsListFuture].
  CarouselAdsListFutureProvider call(int categoryId, {int? subcategoryId}) {
    return CarouselAdsListFutureProvider(
      categoryId,
      subcategoryId: subcategoryId,
    );
  }

  @override
  CarouselAdsListFutureProvider getProviderOverride(
    covariant CarouselAdsListFutureProvider provider,
  ) {
    return call(provider.categoryId, subcategoryId: provider.subcategoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'carouselAdsListFutureProvider';
}

/// See also [carouselAdsListFuture].
class CarouselAdsListFutureProvider extends FutureProvider<List<CarouselAd>> {
  /// See also [carouselAdsListFuture].
  CarouselAdsListFutureProvider(int categoryId, {int? subcategoryId})
    : this._internal(
        (ref) => carouselAdsListFuture(
          ref as CarouselAdsListFutureRef,
          categoryId,
          subcategoryId: subcategoryId,
        ),
        from: carouselAdsListFutureProvider,
        name: r'carouselAdsListFutureProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$carouselAdsListFutureHash,
        dependencies: CarouselAdsListFutureFamily._dependencies,
        allTransitiveDependencies:
            CarouselAdsListFutureFamily._allTransitiveDependencies,
        categoryId: categoryId,
        subcategoryId: subcategoryId,
      );

  CarouselAdsListFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.subcategoryId,
  }) : super.internal();

  final int categoryId;
  final int? subcategoryId;

  @override
  Override overrideWith(
    FutureOr<List<CarouselAd>> Function(CarouselAdsListFutureRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CarouselAdsListFutureProvider._internal(
        (ref) => create(ref as CarouselAdsListFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        subcategoryId: subcategoryId,
      ),
    );
  }

  @override
  FutureProviderElement<List<CarouselAd>> createElement() {
    return _CarouselAdsListFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CarouselAdsListFutureProvider &&
        other.categoryId == categoryId &&
        other.subcategoryId == subcategoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, subcategoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CarouselAdsListFutureRef on FutureProviderRef<List<CarouselAd>> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;

  /// The parameter `subcategoryId` of this provider.
  int? get subcategoryId;
}

class _CarouselAdsListFutureProviderElement
    extends FutureProviderElement<List<CarouselAd>>
    with CarouselAdsListFutureRef {
  _CarouselAdsListFutureProviderElement(super.provider);

  @override
  int get categoryId => (origin as CarouselAdsListFutureProvider).categoryId;
  @override
  int? get subcategoryId =>
      (origin as CarouselAdsListFutureProvider).subcategoryId;
}

String _$adStreamHash() => r'95e83729e28e2d7e799bbdee395553c1051abbd5';

/// See also [adStream].
@ProviderFor(adStream)
const adStreamProvider = AdStreamFamily();

/// See also [adStream].
class AdStreamFamily extends Family<AsyncValue<CarouselAd?>> {
  /// See also [adStream].
  const AdStreamFamily();

  /// See also [adStream].
  AdStreamProvider call(String adId) {
    return AdStreamProvider(adId);
  }

  @override
  AdStreamProvider getProviderOverride(covariant AdStreamProvider provider) {
    return call(provider.adId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'adStreamProvider';
}

/// See also [adStream].
class AdStreamProvider extends AutoDisposeStreamProvider<CarouselAd?> {
  /// See also [adStream].
  AdStreamProvider(String adId)
    : this._internal(
        (ref) => adStream(ref as AdStreamRef, adId),
        from: adStreamProvider,
        name: r'adStreamProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$adStreamHash,
        dependencies: AdStreamFamily._dependencies,
        allTransitiveDependencies: AdStreamFamily._allTransitiveDependencies,
        adId: adId,
      );

  AdStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.adId,
  }) : super.internal();

  final String adId;

  @override
  Override overrideWith(
    Stream<CarouselAd?> Function(AdStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AdStreamProvider._internal(
        (ref) => create(ref as AdStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        adId: adId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<CarouselAd?> createElement() {
    return _AdStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdStreamProvider && other.adId == adId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, adId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AdStreamRef on AutoDisposeStreamProviderRef<CarouselAd?> {
  /// The parameter `adId` of this provider.
  String get adId;
}

class _AdStreamProviderElement
    extends AutoDisposeStreamProviderElement<CarouselAd?>
    with AdStreamRef {
  _AdStreamProviderElement(super.provider);

  @override
  String get adId => (origin as AdStreamProvider).adId;
}

String _$adFutureHash() => r'3573344b18dfee982732d4e7885a41dc7efe1d2c';

/// See also [adFuture].
@ProviderFor(adFuture)
const adFutureProvider = AdFutureFamily();

/// See also [adFuture].
class AdFutureFamily extends Family<AsyncValue<CarouselAd?>> {
  /// See also [adFuture].
  const AdFutureFamily();

  /// See also [adFuture].
  AdFutureProvider call(String adId) {
    return AdFutureProvider(adId);
  }

  @override
  AdFutureProvider getProviderOverride(covariant AdFutureProvider provider) {
    return call(provider.adId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'adFutureProvider';
}

/// See also [adFuture].
class AdFutureProvider extends AutoDisposeFutureProvider<CarouselAd?> {
  /// See also [adFuture].
  AdFutureProvider(String adId)
    : this._internal(
        (ref) => adFuture(ref as AdFutureRef, adId),
        from: adFutureProvider,
        name: r'adFutureProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$adFutureHash,
        dependencies: AdFutureFamily._dependencies,
        allTransitiveDependencies: AdFutureFamily._allTransitiveDependencies,
        adId: adId,
      );

  AdFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.adId,
  }) : super.internal();

  final String adId;

  @override
  Override overrideWith(
    FutureOr<CarouselAd?> Function(AdFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AdFutureProvider._internal(
        (ref) => create(ref as AdFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        adId: adId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CarouselAd?> createElement() {
    return _AdFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdFutureProvider && other.adId == adId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, adId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AdFutureRef on AutoDisposeFutureProviderRef<CarouselAd?> {
  /// The parameter `adId` of this provider.
  String get adId;
}

class _AdFutureProviderElement
    extends AutoDisposeFutureProviderElement<CarouselAd?>
    with AdFutureRef {
  _AdFutureProviderElement(super.provider);

  @override
  String get adId => (origin as AdFutureProvider).adId;
}

String _$finalCarouselAdsHash() => r'2ec19d55118c2380d6d8cbf8b46cd64ddc6f84ff';

/// See also [finalCarouselAds].
@ProviderFor(finalCarouselAds)
const finalCarouselAdsProvider = FinalCarouselAdsFamily();

/// See also [finalCarouselAds].
class FinalCarouselAdsFamily extends Family<AsyncValue<List<CarouselAd>>> {
  /// See also [finalCarouselAds].
  const FinalCarouselAdsFamily();

  /// See also [finalCarouselAds].
  FinalCarouselAdsProvider call(int categoryId, {int? subcategoryId}) {
    return FinalCarouselAdsProvider(categoryId, subcategoryId: subcategoryId);
  }

  @override
  FinalCarouselAdsProvider getProviderOverride(
    covariant FinalCarouselAdsProvider provider,
  ) {
    return call(provider.categoryId, subcategoryId: provider.subcategoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'finalCarouselAdsProvider';
}

/// See also [finalCarouselAds].
class FinalCarouselAdsProvider extends FutureProvider<List<CarouselAd>> {
  /// See also [finalCarouselAds].
  FinalCarouselAdsProvider(int categoryId, {int? subcategoryId})
    : this._internal(
        (ref) => finalCarouselAds(
          ref as FinalCarouselAdsRef,
          categoryId,
          subcategoryId: subcategoryId,
        ),
        from: finalCarouselAdsProvider,
        name: r'finalCarouselAdsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$finalCarouselAdsHash,
        dependencies: FinalCarouselAdsFamily._dependencies,
        allTransitiveDependencies:
            FinalCarouselAdsFamily._allTransitiveDependencies,
        categoryId: categoryId,
        subcategoryId: subcategoryId,
      );

  FinalCarouselAdsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.subcategoryId,
  }) : super.internal();

  final int categoryId;
  final int? subcategoryId;

  @override
  Override overrideWith(
    FutureOr<List<CarouselAd>> Function(FinalCarouselAdsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FinalCarouselAdsProvider._internal(
        (ref) => create(ref as FinalCarouselAdsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        subcategoryId: subcategoryId,
      ),
    );
  }

  @override
  FutureProviderElement<List<CarouselAd>> createElement() {
    return _FinalCarouselAdsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FinalCarouselAdsProvider &&
        other.categoryId == categoryId &&
        other.subcategoryId == subcategoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, subcategoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FinalCarouselAdsRef on FutureProviderRef<List<CarouselAd>> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;

  /// The parameter `subcategoryId` of this provider.
  int? get subcategoryId;
}

class _FinalCarouselAdsProviderElement
    extends FutureProviderElement<List<CarouselAd>>
    with FinalCarouselAdsRef {
  _FinalCarouselAdsProviderElement(super.provider);

  @override
  int get categoryId => (origin as FinalCarouselAdsProvider).categoryId;
  @override
  int? get subcategoryId => (origin as FinalCarouselAdsProvider).subcategoryId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
