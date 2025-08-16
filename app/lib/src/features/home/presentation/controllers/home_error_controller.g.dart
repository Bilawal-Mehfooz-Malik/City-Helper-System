// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_error_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$criticalErrorStatusHash() =>
    r'd92eedce3e1fe5088ca4e784b57512f8dd19b771';

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

/// See also [criticalErrorStatus].
@ProviderFor(criticalErrorStatus)
const criticalErrorStatusProvider = CriticalErrorStatusFamily();

/// See also [criticalErrorStatus].
class CriticalErrorStatusFamily extends Family<AsyncError<void>?> {
  /// See also [criticalErrorStatus].
  const CriticalErrorStatusFamily();

  /// See also [criticalErrorStatus].
  CriticalErrorStatusProvider call({required int categoryId}) {
    return CriticalErrorStatusProvider(categoryId: categoryId);
  }

  @override
  CriticalErrorStatusProvider getProviderOverride(
    covariant CriticalErrorStatusProvider provider,
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
  String? get name => r'criticalErrorStatusProvider';
}

/// See also [criticalErrorStatus].
class CriticalErrorStatusProvider
    extends AutoDisposeProvider<AsyncError<void>?> {
  /// See also [criticalErrorStatus].
  CriticalErrorStatusProvider({required int categoryId})
    : this._internal(
        (ref) => criticalErrorStatus(
          ref as CriticalErrorStatusRef,
          categoryId: categoryId,
        ),
        from: criticalErrorStatusProvider,
        name: r'criticalErrorStatusProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$criticalErrorStatusHash,
        dependencies: CriticalErrorStatusFamily._dependencies,
        allTransitiveDependencies:
            CriticalErrorStatusFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  CriticalErrorStatusProvider._internal(
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
    AsyncError<void>? Function(CriticalErrorStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CriticalErrorStatusProvider._internal(
        (ref) => create(ref as CriticalErrorStatusRef),
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
    return _CriticalErrorStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CriticalErrorStatusProvider &&
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
mixin CriticalErrorStatusRef on AutoDisposeProviderRef<AsyncError<void>?> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;
}

class _CriticalErrorStatusProviderElement
    extends AutoDisposeProviderElement<AsyncError<void>?>
    with CriticalErrorStatusRef {
  _CriticalErrorStatusProviderElement(super.provider);

  @override
  int get categoryId => (origin as CriticalErrorStatusProvider).categoryId;
}

String _$nonCriticalErrorsHash() => r'3d5a3800e6c16f5329f161507dc5950d5a8b76c2';

/// See also [nonCriticalErrors].
@ProviderFor(nonCriticalErrors)
const nonCriticalErrorsProvider = NonCriticalErrorsFamily();

/// See also [nonCriticalErrors].
class NonCriticalErrorsFamily extends Family<List<String>> {
  /// See also [nonCriticalErrors].
  const NonCriticalErrorsFamily();

  /// See also [nonCriticalErrors].
  NonCriticalErrorsProvider call({required int categoryId}) {
    return NonCriticalErrorsProvider(categoryId: categoryId);
  }

  @override
  NonCriticalErrorsProvider getProviderOverride(
    covariant NonCriticalErrorsProvider provider,
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
  String? get name => r'nonCriticalErrorsProvider';
}

/// See also [nonCriticalErrors].
class NonCriticalErrorsProvider extends AutoDisposeProvider<List<String>> {
  /// See also [nonCriticalErrors].
  NonCriticalErrorsProvider({required int categoryId})
    : this._internal(
        (ref) => nonCriticalErrors(
          ref as NonCriticalErrorsRef,
          categoryId: categoryId,
        ),
        from: nonCriticalErrorsProvider,
        name: r'nonCriticalErrorsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$nonCriticalErrorsHash,
        dependencies: NonCriticalErrorsFamily._dependencies,
        allTransitiveDependencies:
            NonCriticalErrorsFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  NonCriticalErrorsProvider._internal(
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
    List<String> Function(NonCriticalErrorsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NonCriticalErrorsProvider._internal(
        (ref) => create(ref as NonCriticalErrorsRef),
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
  AutoDisposeProviderElement<List<String>> createElement() {
    return _NonCriticalErrorsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NonCriticalErrorsProvider && other.categoryId == categoryId;
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
mixin NonCriticalErrorsRef on AutoDisposeProviderRef<List<String>> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;
}

class _NonCriticalErrorsProviderElement
    extends AutoDisposeProviderElement<List<String>>
    with NonCriticalErrorsRef {
  _NonCriticalErrorsProviderElement(super.provider);

  @override
  int get categoryId => (origin as NonCriticalErrorsProvider).categoryId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
