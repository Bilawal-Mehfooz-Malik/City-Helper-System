// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_logger.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(errorLogger)
const errorLoggerProvider = ErrorLoggerProvider._();

final class ErrorLoggerProvider
    extends $FunctionalProvider<ErrorLogger, ErrorLogger, ErrorLogger>
    with $Provider<ErrorLogger> {
  const ErrorLoggerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'errorLoggerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$errorLoggerHash();

  @$internal
  @override
  $ProviderElement<ErrorLogger> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ErrorLogger create(Ref ref) {
    return errorLogger(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ErrorLogger value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ErrorLogger>(value),
    );
  }
}

String _$errorLoggerHash() => r'7b218ca355d3a47fb1653e16bcbc688e6a5584b9';
