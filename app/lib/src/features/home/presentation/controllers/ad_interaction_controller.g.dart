// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_interaction_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AdInteractionNotifier)
const adInteractionProvider = AdInteractionNotifierProvider._();

final class AdInteractionNotifierProvider
    extends $AsyncNotifierProvider<AdInteractionNotifier, void> {
  const AdInteractionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adInteractionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adInteractionNotifierHash();

  @$internal
  @override
  AdInteractionNotifier create() => AdInteractionNotifier();
}

String _$adInteractionNotifierHash() =>
    r'03263b3d36375883901b329f474d6d9928cd30e6';

abstract class _$AdInteractionNotifier extends $AsyncNotifier<void> {
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
