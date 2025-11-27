// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_shop_dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(myShopDashboard)
const myShopDashboardProvider = MyShopDashboardProvider._();

final class MyShopDashboardProvider
    extends
        $FunctionalProvider<
          AsyncValue<EntityDetail?>,
          EntityDetail?,
          FutureOr<EntityDetail?>
        >
    with $FutureModifier<EntityDetail?>, $FutureProvider<EntityDetail?> {
  const MyShopDashboardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myShopDashboardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myShopDashboardHash();

  @$internal
  @override
  $FutureProviderElement<EntityDetail?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EntityDetail?> create(Ref ref) {
    return myShopDashboard(ref);
  }
}

String _$myShopDashboardHash() => r'd9b9daffa2d30b460a7fa0e8fa358a784eb7ab57';
