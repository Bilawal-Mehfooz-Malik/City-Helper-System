// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(entityService)
const entityServiceProvider = EntityServiceProvider._();

final class EntityServiceProvider
    extends $FunctionalProvider<EntityService, EntityService, EntityService>
    with $Provider<EntityService> {
  const EntityServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'entityServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$entityServiceHash();

  @$internal
  @override
  $ProviderElement<EntityService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EntityService create(Ref ref) {
    return entityService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EntityService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EntityService>(value),
    );
  }
}

String _$entityServiceHash() => r'00643418bb39b869ae1f68400734454c994fc864';
