// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_upload_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(imageUploadRepository)
const imageUploadRepositoryProvider = ImageUploadRepositoryProvider._();

final class ImageUploadRepositoryProvider
    extends
        $FunctionalProvider<
          ImageUploadRepository,
          ImageUploadRepository,
          ImageUploadRepository
        >
    with $Provider<ImageUploadRepository> {
  const ImageUploadRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imageUploadRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imageUploadRepositoryHash();

  @$internal
  @override
  $ProviderElement<ImageUploadRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ImageUploadRepository create(Ref ref) {
    return imageUploadRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageUploadRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageUploadRepository>(value),
    );
  }
}

String _$imageUploadRepositoryHash() =>
    r'82faf2123f54333a837c2070e482ec1b2f268dd4';
