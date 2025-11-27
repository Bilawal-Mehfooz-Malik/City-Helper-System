// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user_location_saver.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocalUserLocationSaver)
const localUserLocationSaverProvider = LocalUserLocationSaverProvider._();

final class LocalUserLocationSaverProvider
    extends $AsyncNotifierProvider<LocalUserLocationSaver, void> {
  const LocalUserLocationSaverProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localUserLocationSaverProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localUserLocationSaverHash();

  @$internal
  @override
  LocalUserLocationSaver create() => LocalUserLocationSaver();
}

String _$localUserLocationSaverHash() =>
    r'369036c2a18fe0cd27c8f542ae3c8b109a0d74ff';

abstract class _$LocalUserLocationSaver extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
