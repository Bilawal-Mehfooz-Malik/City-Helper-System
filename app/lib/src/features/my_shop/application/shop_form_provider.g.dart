// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(initialShopCategoryData)
const initialShopCategoryDataProvider = InitialShopCategoryDataFamily._();

final class InitialShopCategoryDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<ShopFormInitialData>,
          ShopFormInitialData,
          FutureOr<ShopFormInitialData>
        >
    with
        $FutureModifier<ShopFormInitialData>,
        $FutureProvider<ShopFormInitialData> {
  const InitialShopCategoryDataProvider._({
    required InitialShopCategoryDataFamily super.from,
    required ({CategoryId categoryId, SubCategoryId? subCategoryId})
    super.argument,
  }) : super(
         retry: null,
         name: r'initialShopCategoryDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$initialShopCategoryDataHash();

  @override
  String toString() {
    return r'initialShopCategoryDataProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<ShopFormInitialData> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ShopFormInitialData> create(Ref ref) {
    final argument =
        this.argument
            as ({CategoryId categoryId, SubCategoryId? subCategoryId});
    return initialShopCategoryData(
      ref,
      categoryId: argument.categoryId,
      subCategoryId: argument.subCategoryId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is InitialShopCategoryDataProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$initialShopCategoryDataHash() =>
    r'f04029d39ea5c5360f3209cf1eba3605351b67c9';

final class InitialShopCategoryDataFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<ShopFormInitialData>,
          ({CategoryId categoryId, SubCategoryId? subCategoryId})
        > {
  const InitialShopCategoryDataFamily._()
    : super(
        retry: null,
        name: r'initialShopCategoryDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InitialShopCategoryDataProvider call({
    required CategoryId categoryId,
    required SubCategoryId? subCategoryId,
  }) => InitialShopCategoryDataProvider._(
    argument: (categoryId: categoryId, subCategoryId: subCategoryId),
    from: this,
  );

  @override
  String toString() => r'initialShopCategoryDataProvider';
}
