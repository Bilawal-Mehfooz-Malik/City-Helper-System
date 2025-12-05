// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_location_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileLocationController)
const profileLocationControllerProvider = ProfileLocationControllerProvider._();

final class ProfileLocationControllerProvider
    extends $AsyncNotifierProvider<ProfileLocationController, LatLng?> {
  const ProfileLocationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileLocationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileLocationControllerHash();

  @$internal
  @override
  ProfileLocationController create() => ProfileLocationController();
}

String _$profileLocationControllerHash() =>
    r'3a1f8b70eb459d2816659588c67cc69419e20fe6';

abstract class _$ProfileLocationController extends $AsyncNotifier<LatLng?> {
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
