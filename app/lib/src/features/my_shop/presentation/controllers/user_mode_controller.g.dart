// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mode_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserModeController)
const userModeControllerProvider = UserModeControllerProvider._();

final class UserModeControllerProvider
    extends $NotifierProvider<UserModeController, bool> {
  const UserModeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userModeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userModeControllerHash();

  @$internal
  @override
  UserModeController create() => UserModeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$userModeControllerHash() =>
    r'91d52f460ed0d95539dde8c41e9c805563b322fa';

abstract class _$UserModeController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
