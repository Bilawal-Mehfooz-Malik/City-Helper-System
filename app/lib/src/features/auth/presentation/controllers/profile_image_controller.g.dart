// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_image_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileImageController)
const profileImageControllerProvider = ProfileImageControllerProvider._();

final class ProfileImageControllerProvider
    extends $NotifierProvider<ProfileImageController, ProfileImageState> {
  const ProfileImageControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileImageControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileImageControllerHash();

  @$internal
  @override
  ProfileImageController create() => ProfileImageController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileImageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileImageState>(value),
    );
  }
}

String _$profileImageControllerHash() =>
    r'54011b8fa7e0e52189b2322d327fdf0a090a9f9c';

abstract class _$ProfileImageController extends $Notifier<ProfileImageState> {
  ProfileImageState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProfileImageState, ProfileImageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileImageState, ProfileImageState>,
              ProfileImageState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
