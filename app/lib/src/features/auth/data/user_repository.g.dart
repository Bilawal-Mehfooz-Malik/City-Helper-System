// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userRepository)
const userRepositoryProvider = UserRepositoryProvider._();

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  const UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'1a4e42f29e04239b4ad4b601f59649a769f6431e';

@ProviderFor(getUserById)
const getUserByIdProvider = GetUserByIdFamily._();

final class GetUserByIdProvider
    extends
        $FunctionalProvider<AsyncValue<AppUser?>, AppUser?, Stream<AppUser?>>
    with $FutureModifier<AppUser?>, $StreamProvider<AppUser?> {
  const GetUserByIdProvider._({
    required GetUserByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getUserByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getUserByIdHash();

  @override
  String toString() {
    return r'getUserByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<AppUser?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<AppUser?> create(Ref ref) {
    final argument = this.argument as String;
    return getUserById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUserByIdHash() => r'492204c000cd69c1747daba9b4bd51d70d80e6ba';

final class GetUserByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<AppUser?>, String> {
  const GetUserByIdFamily._()
    : super(
        retry: null,
        name: r'getUserByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetUserByIdProvider call(String uid) =>
      GetUserByIdProvider._(argument: uid, from: this);

  @override
  String toString() => r'getUserByIdProvider';
}

@ProviderFor(fetchUserById)
const fetchUserByIdProvider = FetchUserByIdFamily._();

final class FetchUserByIdProvider
    extends
        $FunctionalProvider<AsyncValue<AppUser?>, AppUser?, FutureOr<AppUser?>>
    with $FutureModifier<AppUser?>, $FutureProvider<AppUser?> {
  const FetchUserByIdProvider._({
    required FetchUserByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchUserByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchUserByIdHash();

  @override
  String toString() {
    return r'fetchUserByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AppUser?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AppUser?> create(Ref ref) {
    final argument = this.argument as String;
    return fetchUserById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchUserByIdHash() => r'd19551808e0ecad2521885b9abb875d8d8c5988a';

final class FetchUserByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AppUser?>, String> {
  const FetchUserByIdFamily._()
    : super(
        retry: null,
        name: r'fetchUserByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchUserByIdProvider call(String uid) =>
      FetchUserByIdProvider._(argument: uid, from: this);

  @override
  String toString() => r'fetchUserByIdProvider';
}
