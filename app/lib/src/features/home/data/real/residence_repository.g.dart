// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residence_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(residenceRepository)
const residenceRepositoryProvider = ResidenceRepositoryProvider._();

final class ResidenceRepositoryProvider
    extends
        $FunctionalProvider<
          ResidenceRepository,
          ResidenceRepository,
          ResidenceRepository
        >
    with $Provider<ResidenceRepository> {
  const ResidenceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'residenceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$residenceRepositoryHash();

  @$internal
  @override
  $ProviderElement<ResidenceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResidenceRepository create(Ref ref) {
    return residenceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResidenceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResidenceRepository>(value),
    );
  }
}

String _$residenceRepositoryHash() =>
    r'02f220ae8467d7ad4ab52b67ea951f2ee138a6bd';
