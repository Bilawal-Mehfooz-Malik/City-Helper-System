// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_categories_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(subCategoriesRepository)
const subCategoriesRepositoryProvider = SubCategoriesRepositoryProvider._();

final class SubCategoriesRepositoryProvider
    extends
        $FunctionalProvider<
          SubCategoriesRepository,
          SubCategoriesRepository,
          SubCategoriesRepository
        >
    with $Provider<SubCategoriesRepository> {
  const SubCategoriesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subCategoriesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subCategoriesRepositoryHash();

  @$internal
  @override
  $ProviderElement<SubCategoriesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubCategoriesRepository create(Ref ref) {
    return subCategoriesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubCategoriesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubCategoriesRepository>(value),
    );
  }
}

String _$subCategoriesRepositoryHash() =>
    r'14f3f2a6ad8c720056b17de322bd147b3d92ce63';

@ProviderFor(subCategoriesListFuture)
const subCategoriesListFutureProvider = SubCategoriesListFutureFamily._();

final class SubCategoriesListFutureProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SubCategory>>,
          List<SubCategory>,
          FutureOr<List<SubCategory>>
        >
    with
        $FutureModifier<List<SubCategory>>,
        $FutureProvider<List<SubCategory>> {
  const SubCategoriesListFutureProvider._({
    required SubCategoriesListFutureFamily super.from,
    required CategoryId super.argument,
  }) : super(
         retry: null,
         name: r'subCategoriesListFutureProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$subCategoriesListFutureHash();

  @override
  String toString() {
    return r'subCategoriesListFutureProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<SubCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SubCategory>> create(Ref ref) {
    final argument = this.argument as CategoryId;
    return subCategoriesListFuture(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SubCategoriesListFutureProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$subCategoriesListFutureHash() =>
    r'3fc7f69de5daf9c71035e362f9f30c339e14b931';

final class SubCategoriesListFutureFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<SubCategory>>, CategoryId> {
  const SubCategoriesListFutureFamily._()
    : super(
        retry: null,
        name: r'subCategoriesListFutureProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  SubCategoriesListFutureProvider call(CategoryId id) =>
      SubCategoriesListFutureProvider._(argument: id, from: this);

  @override
  String toString() => r'subCategoriesListFutureProvider';
}

@ProviderFor(subCategoryFuture)
const subCategoryFutureProvider = SubCategoryFutureFamily._();

final class SubCategoryFutureProvider
    extends
        $FunctionalProvider<
          AsyncValue<SubCategory?>,
          SubCategory?,
          FutureOr<SubCategory?>
        >
    with $FutureModifier<SubCategory?>, $FutureProvider<SubCategory?> {
  const SubCategoryFutureProvider._({
    required SubCategoryFutureFamily super.from,
    required SubCategoryId super.argument,
  }) : super(
         retry: null,
         name: r'subCategoryFutureProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$subCategoryFutureHash();

  @override
  String toString() {
    return r'subCategoryFutureProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SubCategory?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SubCategory?> create(Ref ref) {
    final argument = this.argument as SubCategoryId;
    return subCategoryFuture(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SubCategoryFutureProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$subCategoryFutureHash() => r'f4e0b261a18165e273b07631313663d4ee406af9';

final class SubCategoryFutureFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SubCategory?>, SubCategoryId> {
  const SubCategoryFutureFamily._()
    : super(
        retry: null,
        name: r'subCategoryFutureProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  SubCategoryFutureProvider call(SubCategoryId id) =>
      SubCategoryFutureProvider._(argument: id, from: this);

  @override
  String toString() => r'subCategoryFutureProvider';
}
