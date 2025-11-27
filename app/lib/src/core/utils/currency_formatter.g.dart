// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_formatter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currencyFormatter)
const currencyFormatterProvider = CurrencyFormatterProvider._();

final class CurrencyFormatterProvider
    extends $FunctionalProvider<NumberFormat, NumberFormat, NumberFormat>
    with $Provider<NumberFormat> {
  const CurrencyFormatterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currencyFormatterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currencyFormatterHash();

  @$internal
  @override
  $ProviderElement<NumberFormat> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NumberFormat create(Ref ref) {
    return currencyFormatter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NumberFormat value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NumberFormat>(value),
    );
  }
}

String _$currencyFormatterHash() => r'9cb054c88dd735d41559fec36b300234ad4a24ee';
