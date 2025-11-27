// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_details_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(foodDetailsRepository)
const foodDetailsRepositoryProvider = FoodDetailsRepositoryProvider._();

final class FoodDetailsRepositoryProvider
    extends
        $FunctionalProvider<
          FoodDetailsRepository,
          FoodDetailsRepository,
          FoodDetailsRepository
        >
    with $Provider<FoodDetailsRepository> {
  const FoodDetailsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'foodDetailsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$foodDetailsRepositoryHash();

  @$internal
  @override
  $ProviderElement<FoodDetailsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FoodDetailsRepository create(Ref ref) {
    return foodDetailsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FoodDetailsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FoodDetailsRepository>(value),
    );
  }
}

String _$foodDetailsRepositoryHash() =>
    r'0fe0a80dafd3fa48df7b7c6c75ac7147d2084226';
