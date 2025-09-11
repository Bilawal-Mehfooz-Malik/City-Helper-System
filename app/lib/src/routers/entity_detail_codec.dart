import 'dart:convert';

import 'package:app/src/features/home_detail/domain/entity_detail.dart';

class EntityDetailCodec extends Codec<EntityDetail, String> {
  const EntityDetailCodec();

  @override
  Converter<String, EntityDetail> get decoder =>
      const _EntityDetailDecoder();

  @override
  Converter<EntityDetail, String> get encoder =>
      const _EntityDetailEncoder();
}

class _EntityDetailEncoder extends Converter<EntityDetail, String> {
  const _EntityDetailEncoder();

  @override
  String convert(EntityDetail input) {
    return json.encode(input.toJson());
  }
}

class _EntityDetailDecoder extends Converter<String, EntityDetail> {
  const _EntityDetailDecoder();

  @override
  EntityDetail convert(String input) {
    return EntityDetail.fromJson(json.decode(input) as Map<String, Object?>);
  }
}
