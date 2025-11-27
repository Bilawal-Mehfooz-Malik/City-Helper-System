// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residence_details_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(residenceDetailsRepository)
const residenceDetailsRepositoryProvider =
    ResidenceDetailsRepositoryProvider._();

final class ResidenceDetailsRepositoryProvider
    extends
        $FunctionalProvider<
          ResidenceDetailsRepository,
          ResidenceDetailsRepository,
          ResidenceDetailsRepository
        >
    with $Provider<ResidenceDetailsRepository> {
  const ResidenceDetailsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'residenceDetailsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$residenceDetailsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ResidenceDetailsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResidenceDetailsRepository create(Ref ref) {
    return residenceDetailsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResidenceDetailsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResidenceDetailsRepository>(value),
    );
  }
}

String _$residenceDetailsRepositoryHash() =>
    r'5de79b04ea58f128ae24704f28237d2fff39189d';
