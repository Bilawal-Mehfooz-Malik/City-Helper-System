// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_formatter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dateFormatter)
const dateFormatterProvider = DateFormatterProvider._();

final class DateFormatterProvider
    extends $FunctionalProvider<DateFormat, DateFormat, DateFormat>
    with $Provider<DateFormat> {
  const DateFormatterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dateFormatterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dateFormatterHash();

  @$internal
  @override
  $ProviderElement<DateFormat> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DateFormat create(Ref ref) {
    return dateFormatter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateFormat value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateFormat>(value),
    );
  }
}

String _$dateFormatterHash() => r'9a8081519799f20b71e851dbd516c4ab05cdde42';
