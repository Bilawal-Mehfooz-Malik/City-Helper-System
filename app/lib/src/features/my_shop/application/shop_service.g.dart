// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shopServiceHash() => r'e653b2ff8bf17b06b4447abde134ee458adaae21';

/// See also [shopService].
@ProviderFor(shopService)
final shopServiceProvider = AutoDisposeProvider<ShopService>.internal(
  shopService,
  name: r'shopServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$shopServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShopServiceRef = AutoDisposeProviderRef<ShopService>;
String _$userShopHash() => r'c5eed5d77e7f028e50672d7b88f1d5932c3dbbfa';

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

/// See also [userShop].
@ProviderFor(userShop)
const userShopProvider = UserShopFamily();

/// See also [userShop].
class UserShopFamily extends Family<AsyncValue<EntityDetail?>> {
  /// See also [userShop].
  const UserShopFamily();

  /// See also [userShop].
  UserShopProvider call(String userId) {
    return UserShopProvider(userId);
  }

  @override
  UserShopProvider getProviderOverride(covariant UserShopProvider provider) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userShopProvider';
}

/// See also [userShop].
class UserShopProvider extends AutoDisposeFutureProvider<EntityDetail?> {
  /// See also [userShop].
  UserShopProvider(String userId)
    : this._internal(
        (ref) => userShop(ref as UserShopRef, userId),
        from: userShopProvider,
        name: r'userShopProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$userShopHash,
        dependencies: UserShopFamily._dependencies,
        allTransitiveDependencies: UserShopFamily._allTransitiveDependencies,
        userId: userId,
      );

  UserShopProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<EntityDetail?> Function(UserShopRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserShopProvider._internal(
        (ref) => create(ref as UserShopRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EntityDetail?> createElement() {
    return _UserShopProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserShopProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserShopRef on AutoDisposeFutureProviderRef<EntityDetail?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserShopProviderElement
    extends AutoDisposeFutureProviderElement<EntityDetail?>
    with UserShopRef {
  _UserShopProviderElement(super.provider);

  @override
  String get userId => (origin as UserShopProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
