// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_search_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(residenceSearchRepository)
const residenceSearchRepositoryProvider = ResidenceSearchRepositoryProvider._();

final class ResidenceSearchRepositoryProvider
    extends
        $FunctionalProvider<
          EntitySearchRepository,
          EntitySearchRepository,
          EntitySearchRepository
        >
    with $Provider<EntitySearchRepository> {
  const ResidenceSearchRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'residenceSearchRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$residenceSearchRepositoryHash();

  @$internal
  @override
  $ProviderElement<EntitySearchRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EntitySearchRepository create(Ref ref) {
    return residenceSearchRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EntitySearchRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EntitySearchRepository>(value),
    );
  }
}

String _$residenceSearchRepositoryHash() =>
    r'fc7919ab2d8fe77b815af76b70cbe8bf9e12ad12';

@ProviderFor(foodSearchRepository)
const foodSearchRepositoryProvider = FoodSearchRepositoryProvider._();

final class FoodSearchRepositoryProvider
    extends
        $FunctionalProvider<
          EntitySearchRepository,
          EntitySearchRepository,
          EntitySearchRepository
        >
    with $Provider<EntitySearchRepository> {
  const FoodSearchRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'foodSearchRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$foodSearchRepositoryHash();

  @$internal
  @override
  $ProviderElement<EntitySearchRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EntitySearchRepository create(Ref ref) {
    return foodSearchRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EntitySearchRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EntitySearchRepository>(value),
    );
  }
}

String _$foodSearchRepositoryHash() =>
    r'ff5c4e66d1fba75a4c45f9936cdc478b349f6556';

@ProviderFor(searchByCategoryId)
const searchByCategoryIdProvider = SearchByCategoryIdFamily._();

final class SearchByCategoryIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SearchEntity>>,
          List<SearchEntity>,
          FutureOr<List<SearchEntity>>
        >
    with
        $FutureModifier<List<SearchEntity>>,
        $FutureProvider<List<SearchEntity>> {
  const SearchByCategoryIdProvider._({
    required SearchByCategoryIdFamily super.from,
    required ({CategoryId categoryId, String query}) super.argument,
  }) : super(
         retry: null,
         name: r'searchByCategoryIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchByCategoryIdHash();

  @override
  String toString() {
    return r'searchByCategoryIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<SearchEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SearchEntity>> create(Ref ref) {
    final argument = this.argument as ({CategoryId categoryId, String query});
    return searchByCategoryId(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchByCategoryIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchByCategoryIdHash() =>
    r'6b270049a3db5158355da964632b36d280e3a403';

final class SearchByCategoryIdFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<SearchEntity>>,
          ({CategoryId categoryId, String query})
        > {
  const SearchByCategoryIdFamily._()
    : super(
        retry: null,
        name: r'searchByCategoryIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SearchByCategoryIdProvider call(
    ({CategoryId categoryId, String query}) input,
  ) => SearchByCategoryIdProvider._(argument: input, from: this);

  @override
  String toString() => r'searchByCategoryIdProvider';
}
