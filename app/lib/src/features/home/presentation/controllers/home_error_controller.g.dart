// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_error_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(criticalErrorStatus)
const criticalErrorStatusProvider = CriticalErrorStatusFamily._();

final class CriticalErrorStatusProvider
    extends
        $FunctionalProvider<
          AsyncError<void>?,
          AsyncError<void>?,
          AsyncError<void>?
        >
    with $Provider<AsyncError<void>?> {
  const CriticalErrorStatusProvider._({
    required CriticalErrorStatusFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'criticalErrorStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$criticalErrorStatusHash();

  @override
  String toString() {
    return r'criticalErrorStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncError<void>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncError<void>? create(Ref ref) {
    final argument = this.argument as int;
    return criticalErrorStatus(ref, categoryId: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncError<void>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncError<void>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CriticalErrorStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$criticalErrorStatusHash() =>
    r'2fef038d2c797532e57df88cd6c8a27b717e398d';

final class CriticalErrorStatusFamily extends $Family
    with $FunctionalFamilyOverride<AsyncError<void>?, int> {
  const CriticalErrorStatusFamily._()
    : super(
        retry: null,
        name: r'criticalErrorStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CriticalErrorStatusProvider call({required int categoryId}) =>
      CriticalErrorStatusProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'criticalErrorStatusProvider';
}

@ProviderFor(nonCriticalErrors)
const nonCriticalErrorsProvider = NonCriticalErrorsFamily._();

final class NonCriticalErrorsProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  const NonCriticalErrorsProvider._({
    required NonCriticalErrorsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'nonCriticalErrorsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$nonCriticalErrorsHash();

  @override
  String toString() {
    return r'nonCriticalErrorsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    final argument = this.argument as int;
    return nonCriticalErrors(ref, categoryId: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NonCriticalErrorsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$nonCriticalErrorsHash() => r'6a5a4fc32bdcc1d4fcf1aedd3d8823fbb8c452d6';

final class NonCriticalErrorsFamily extends $Family
    with $FunctionalFamilyOverride<List<String>, int> {
  const NonCriticalErrorsFamily._()
    : super(
        retry: null,
        name: r'nonCriticalErrorsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NonCriticalErrorsProvider call({required int categoryId}) =>
      NonCriticalErrorsProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'nonCriticalErrorsProvider';
}
