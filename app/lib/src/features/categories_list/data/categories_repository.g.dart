// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(categoriesRepository)
const categoriesRepositoryProvider = CategoriesRepositoryProvider._();

final class CategoriesRepositoryProvider
    extends
        $FunctionalProvider<
          CategoriesRepository,
          CategoriesRepository,
          CategoriesRepository
        >
    with $Provider<CategoriesRepository> {
  const CategoriesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesRepositoryHash();

  @$internal
  @override
  $ProviderElement<CategoriesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CategoriesRepository create(Ref ref) {
    return categoriesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoriesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoriesRepository>(value),
    );
  }
}

String _$categoriesRepositoryHash() =>
    r'f1445cfb02398fcc5daaf8a99c508733ad3f9148';

@ProviderFor(categoriesListStream)
const categoriesListStreamProvider = CategoriesListStreamProvider._();

final class CategoriesListStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Category>>,
          List<Category>,
          Stream<List<Category>>
        >
    with $FutureModifier<List<Category>>, $StreamProvider<List<Category>> {
  const CategoriesListStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesListStreamProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesListStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<Category>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Category>> create(Ref ref) {
    return categoriesListStream(ref);
  }
}

String _$categoriesListStreamHash() =>
    r'c26715bb743388bd4cb030d4a31f287cbd9a761b';

@ProviderFor(categoriesListFuture)
const categoriesListFutureProvider = CategoriesListFutureProvider._();

final class CategoriesListFutureProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Category>>,
          List<Category>,
          FutureOr<List<Category>>
        >
    with $FutureModifier<List<Category>>, $FutureProvider<List<Category>> {
  const CategoriesListFutureProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesListFutureProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesListFutureHash();

  @$internal
  @override
  $FutureProviderElement<List<Category>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Category>> create(Ref ref) {
    return categoriesListFuture(ref);
  }
}

String _$categoriesListFutureHash() =>
    r'4ad55643af4b21d77fc125a5562ac4aaa3c19955';

@ProviderFor(categoryStream)
const categoryStreamProvider = CategoryStreamFamily._();

final class CategoryStreamProvider
    extends
        $FunctionalProvider<AsyncValue<Category?>, Category?, Stream<Category?>>
    with $FutureModifier<Category?>, $StreamProvider<Category?> {
  const CategoryStreamProvider._({
    required CategoryStreamFamily super.from,
    required CategoryId super.argument,
  }) : super(
         retry: null,
         name: r'categoryStreamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$categoryStreamHash();

  @override
  String toString() {
    return r'categoryStreamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Category?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Category?> create(Ref ref) {
    final argument = this.argument as CategoryId;
    return categoryStream(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$categoryStreamHash() => r'cf92d0825e0af50ff5799f497192f81c511ffe45';

final class CategoryStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Category?>, CategoryId> {
  const CategoryStreamFamily._()
    : super(
        retry: null,
        name: r'categoryStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CategoryStreamProvider call(CategoryId id) =>
      CategoryStreamProvider._(argument: id, from: this);

  @override
  String toString() => r'categoryStreamProvider';
}

@ProviderFor(categoryFuture)
const categoryFutureProvider = CategoryFutureFamily._();

final class CategoryFutureProvider
    extends
        $FunctionalProvider<
          AsyncValue<Category?>,
          Category?,
          FutureOr<Category?>
        >
    with $FutureModifier<Category?>, $FutureProvider<Category?> {
  const CategoryFutureProvider._({
    required CategoryFutureFamily super.from,
    required CategoryId super.argument,
  }) : super(
         retry: null,
         name: r'categoryFutureProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$categoryFutureHash();

  @override
  String toString() {
    return r'categoryFutureProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Category?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Category?> create(Ref ref) {
    final argument = this.argument as CategoryId;
    return categoryFuture(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryFutureProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$categoryFutureHash() => r'd3657f534661b0b7ee46821377d30edefcb4cfa1';

final class CategoryFutureFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Category?>, CategoryId> {
  const CategoryFutureFamily._()
    : super(
        retry: null,
        name: r'categoryFutureProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CategoryFutureProvider call(CategoryId id) =>
      CategoryFutureProvider._(argument: id, from: this);

  @override
  String toString() => r'categoryFutureProvider';
}
