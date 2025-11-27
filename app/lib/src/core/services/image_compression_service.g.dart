// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_compression_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(imageCompressionService)
const imageCompressionServiceProvider = ImageCompressionServiceProvider._();

final class ImageCompressionServiceProvider
    extends
        $FunctionalProvider<
          ImageCompressionService,
          ImageCompressionService,
          ImageCompressionService
        >
    with $Provider<ImageCompressionService> {
  const ImageCompressionServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imageCompressionServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imageCompressionServiceHash();

  @$internal
  @override
  $ProviderElement<ImageCompressionService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ImageCompressionService create(Ref ref) {
    return imageCompressionService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageCompressionService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageCompressionService>(value),
    );
  }
}

String _$imageCompressionServiceHash() =>
    r'6b5dc95ea0a2f4d8f2167fb5b11ed36aedbbe9b5';
