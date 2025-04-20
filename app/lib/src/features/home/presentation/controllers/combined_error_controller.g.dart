// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combined_error_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$combinedErrorStatusHash() =>
    r'6422556860c7d84f110e930af714626c1b609da1';

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

/// See also [combinedErrorStatus].
@ProviderFor(combinedErrorStatus)
const combinedErrorStatusProvider = CombinedErrorStatusFamily();

/// See also [combinedErrorStatus].
class CombinedErrorStatusFamily extends Family<AsyncError<void>?> {
  /// See also [combinedErrorStatus].
  const CombinedErrorStatusFamily();

  /// See also [combinedErrorStatus].
  CombinedErrorStatusProvider call({required int categoryId}) {
    return CombinedErrorStatusProvider(categoryId: categoryId);
  }

  @override
  CombinedErrorStatusProvider getProviderOverride(
    covariant CombinedErrorStatusProvider provider,
  ) {
    return call(categoryId: provider.categoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'combinedErrorStatusProvider';
}

/// See also [combinedErrorStatus].
class CombinedErrorStatusProvider
    extends AutoDisposeProvider<AsyncError<void>?> {
  /// See also [combinedErrorStatus].
  CombinedErrorStatusProvider({required int categoryId})
    : this._internal(
        (ref) => combinedErrorStatus(
          ref as CombinedErrorStatusRef,
          categoryId: categoryId,
        ),
        from: combinedErrorStatusProvider,
        name: r'combinedErrorStatusProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$combinedErrorStatusHash,
        dependencies: CombinedErrorStatusFamily._dependencies,
        allTransitiveDependencies:
            CombinedErrorStatusFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  CombinedErrorStatusProvider._internal(
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
    AsyncError<void>? Function(CombinedErrorStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CombinedErrorStatusProvider._internal(
        (ref) => create(ref as CombinedErrorStatusRef),
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
  AutoDisposeProviderElement<AsyncError<void>?> createElement() {
    return _CombinedErrorStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CombinedErrorStatusProvider &&
        other.categoryId == categoryId;
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
mixin CombinedErrorStatusRef on AutoDisposeProviderRef<AsyncError<void>?> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;
}

class _CombinedErrorStatusProviderElement
    extends AutoDisposeProviderElement<AsyncError<void>?>
    with CombinedErrorStatusRef {
  _CombinedErrorStatusProviderElement(super.provider);

  @override
  int get categoryId => (origin as CombinedErrorStatusProvider).categoryId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
