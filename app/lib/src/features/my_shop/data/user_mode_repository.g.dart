// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mode_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userModeRepository)
const userModeRepositoryProvider = UserModeRepositoryProvider._();

final class UserModeRepositoryProvider
    extends
        $FunctionalProvider<
          UserModeRepository,
          UserModeRepository,
          UserModeRepository
        >
    with $Provider<UserModeRepository> {
  const UserModeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userModeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userModeRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserModeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserModeRepository create(Ref ref) {
    return userModeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserModeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserModeRepository>(value),
    );
  }
}

String _$userModeRepositoryHash() =>
    r'b3922787057ba3439218c93ac4b00ada82a91a31';
