// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserLocationController)
const userLocationControllerProvider = UserLocationControllerProvider._();

final class UserLocationControllerProvider
    extends $AsyncNotifierProvider<UserLocationController, LatLng?> {
  const UserLocationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLocationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userLocationControllerHash();

  @$internal
  @override
  UserLocationController create() => UserLocationController();
}

String _$userLocationControllerHash() =>
    r'390c257440b336a6f96cb233bff8402171ff93fc';

abstract class _$UserLocationController extends $AsyncNotifier<LatLng?> {
  FutureOr<LatLng?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<LatLng?>, LatLng?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LatLng?>, LatLng?>,
              AsyncValue<LatLng?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
