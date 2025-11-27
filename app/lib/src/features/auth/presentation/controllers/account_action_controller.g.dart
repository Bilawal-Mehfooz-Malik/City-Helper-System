// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_action_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AccountActionController)
const accountActionControllerProvider = AccountActionControllerProvider._();

final class AccountActionControllerProvider
    extends $NotifierProvider<AccountActionController, AccountAction> {
  const AccountActionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountActionControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountActionControllerHash();

  @$internal
  @override
  AccountActionController create() => AccountActionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccountAction value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccountAction>(value),
    );
  }
}

String _$accountActionControllerHash() =>
    r'3b7277b5af09e8cdc2760a9f5ad866cd4085fe6d';

abstract class _$AccountActionController extends $Notifier<AccountAction> {
  AccountAction build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AccountAction, AccountAction>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AccountAction, AccountAction>,
              AccountAction,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
