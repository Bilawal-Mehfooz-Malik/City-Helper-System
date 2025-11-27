// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_limit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(initialLoadLimit)
const initialLoadLimitProvider = InitialLoadLimitProvider._();

final class InitialLoadLimitProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  const InitialLoadLimitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initialLoadLimitProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$initialLoadLimitHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return initialLoadLimit(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$initialLoadLimitHash() => r'098e50e11456af4806638f81214d8777938150fd';

@ProviderFor(subsequentLoadLimit)
const subsequentLoadLimitProvider = SubsequentLoadLimitProvider._();

final class SubsequentLoadLimitProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  const SubsequentLoadLimitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subsequentLoadLimitProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subsequentLoadLimitHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return subsequentLoadLimit(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$subsequentLoadLimitHash() =>
    r'05921cad6e4e59e7996ff8f684d95a05a28cc2e8';
