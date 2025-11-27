// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shopService)
const shopServiceProvider = ShopServiceProvider._();

final class ShopServiceProvider
    extends $FunctionalProvider<ShopService, ShopService, ShopService>
    with $Provider<ShopService> {
  const ShopServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shopServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shopServiceHash();

  @$internal
  @override
  $ProviderElement<ShopService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ShopService create(Ref ref) {
    return shopService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShopService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShopService>(value),
    );
  }
}

String _$shopServiceHash() => r'e653b2ff8bf17b06b4447abde134ee458adaae21';

@ProviderFor(fetchUserShop)
const fetchUserShopProvider = FetchUserShopFamily._();

final class FetchUserShopProvider
    extends
        $FunctionalProvider<
          AsyncValue<EntityDetail?>,
          EntityDetail?,
          FutureOr<EntityDetail?>
        >
    with $FutureModifier<EntityDetail?>, $FutureProvider<EntityDetail?> {
  const FetchUserShopProvider._({
    required FetchUserShopFamily super.from,
    required UserId super.argument,
  }) : super(
         retry: null,
         name: r'fetchUserShopProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchUserShopHash();

  @override
  String toString() {
    return r'fetchUserShopProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<EntityDetail?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EntityDetail?> create(Ref ref) {
    final argument = this.argument as UserId;
    return fetchUserShop(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserShopProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchUserShopHash() => r'da2f163b7daba7b064743cc98c61294235fc5bc6';

final class FetchUserShopFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<EntityDetail?>, UserId> {
  const FetchUserShopFamily._()
    : super(
        retry: null,
        name: r'fetchUserShopProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchUserShopProvider call(UserId userId) =>
      FetchUserShopProvider._(argument: userId, from: this);

  @override
  String toString() => r'fetchUserShopProvider';
}

@ProviderFor(watchUserShop)
const watchUserShopProvider = WatchUserShopFamily._();

final class WatchUserShopProvider
    extends
        $FunctionalProvider<
          AsyncValue<EntityDetail?>,
          EntityDetail?,
          Stream<EntityDetail?>
        >
    with $FutureModifier<EntityDetail?>, $StreamProvider<EntityDetail?> {
  const WatchUserShopProvider._({
    required WatchUserShopFamily super.from,
    required UserId super.argument,
  }) : super(
         retry: null,
         name: r'watchUserShopProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$watchUserShopHash();

  @override
  String toString() {
    return r'watchUserShopProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<EntityDetail?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<EntityDetail?> create(Ref ref) {
    final argument = this.argument as UserId;
    return watchUserShop(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchUserShopProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$watchUserShopHash() => r'd66071cdcaf8f5676080c27fd95a296a6e52c15a';

final class WatchUserShopFamily extends $Family
    with $FunctionalFamilyOverride<Stream<EntityDetail?>, UserId> {
  const WatchUserShopFamily._()
    : super(
        retry: null,
        name: r'watchUserShopProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WatchUserShopProvider call(UserId userId) =>
      WatchUserShopProvider._(argument: userId, from: this);

  @override
  String toString() => r'watchUserShopProvider';
}
