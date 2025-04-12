// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_carousel_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adsCarouselRepositoryHash() =>
    r'1a61b3680d771a8f86f72920a58e00d0c62edb5c';

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
String _$adsListStreamHash() => r'8bdb4ffbeb3fbb3ac222a07d4e11ca6b4709c90c';

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

/// See also [adsListStream].
@ProviderFor(adsListStream)
const adsListStreamProvider = AdsListStreamFamily();

/// See also [adsListStream].
class AdsListStreamFamily extends Family<AsyncValue<List<CarouselAd>>> {
  /// See also [adsListStream].
  const AdsListStreamFamily();

  /// See also [adsListStream].
  AdsListStreamProvider call(int categoryId) {
    return AdsListStreamProvider(categoryId);
  }

  @override
  AdsListStreamProvider getProviderOverride(
    covariant AdsListStreamProvider provider,
  ) {
    return call(provider.categoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'adsListStreamProvider';
}

/// See also [adsListStream].
class AdsListStreamProvider
    extends AutoDisposeStreamProvider<List<CarouselAd>> {
  /// See also [adsListStream].
  AdsListStreamProvider(int categoryId)
    : this._internal(
        (ref) => adsListStream(ref as AdsListStreamRef, categoryId),
        from: adsListStreamProvider,
        name: r'adsListStreamProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$adsListStreamHash,
        dependencies: AdsListStreamFamily._dependencies,
        allTransitiveDependencies:
            AdsListStreamFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  AdsListStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final int categoryId;

  @override
  Override overrideWith(
    Stream<List<CarouselAd>> Function(AdsListStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AdsListStreamProvider._internal(
        (ref) => create(ref as AdsListStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<CarouselAd>> createElement() {
    return _AdsListStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdsListStreamProvider && other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AdsListStreamRef on AutoDisposeStreamProviderRef<List<CarouselAd>> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;
}

class _AdsListStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<CarouselAd>>
    with AdsListStreamRef {
  _AdsListStreamProviderElement(super.provider);

  @override
  int get categoryId => (origin as AdsListStreamProvider).categoryId;
}

String _$adsListFutureHash() => r'3ba086a3084bc1ce94b2f6155054839234cb7ebb';

/// See also [adsListFuture].
@ProviderFor(adsListFuture)
const adsListFutureProvider = AdsListFutureFamily();

/// See also [adsListFuture].
class AdsListFutureFamily extends Family<AsyncValue<List<CarouselAd>>> {
  /// See also [adsListFuture].
  const AdsListFutureFamily();

  /// See also [adsListFuture].
  AdsListFutureProvider call(int categoryId) {
    return AdsListFutureProvider(categoryId);
  }

  @override
  AdsListFutureProvider getProviderOverride(
    covariant AdsListFutureProvider provider,
  ) {
    return call(provider.categoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'adsListFutureProvider';
}

/// See also [adsListFuture].
class AdsListFutureProvider
    extends AutoDisposeFutureProvider<List<CarouselAd>> {
  /// See also [adsListFuture].
  AdsListFutureProvider(int categoryId)
    : this._internal(
        (ref) => adsListFuture(ref as AdsListFutureRef, categoryId),
        from: adsListFutureProvider,
        name: r'adsListFutureProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$adsListFutureHash,
        dependencies: AdsListFutureFamily._dependencies,
        allTransitiveDependencies:
            AdsListFutureFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  AdsListFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final int categoryId;

  @override
  Override overrideWith(
    FutureOr<List<CarouselAd>> Function(AdsListFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AdsListFutureProvider._internal(
        (ref) => create(ref as AdsListFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CarouselAd>> createElement() {
    return _AdsListFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdsListFutureProvider && other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AdsListFutureRef on AutoDisposeFutureProviderRef<List<CarouselAd>> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;
}

class _AdsListFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<CarouselAd>>
    with AdsListFutureRef {
  _AdsListFutureProviderElement(super.provider);

  @override
  int get categoryId => (origin as AdsListFutureProvider).categoryId;
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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
