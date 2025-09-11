import 'dart:convert';

import 'package:app/src/features/home_detail/domain/entity_detail.dart';

class JsonExtraCodec extends Codec<Object?, Object?> {
  const JsonExtraCodec();

  @override
  Converter<Object?, Object?> get decoder => const _JsonDecoder();

  @override
  Converter<Object?, Object?> get encoder => const _JsonEncoder();
}

class _JsonEncoder extends Converter<Object?, Object?> {
  const _JsonEncoder();

  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    if (input is EntityDetail) {
      return {
        'type': 'EntityDetail',
        'data': json.encode(input.toJson()),
      };
    }
    return input;
  }
}

class _JsonDecoder extends Converter<Object?, Object?> {
  const _JsonDecoder();

  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    if (input is Map && input['type'] == 'EntityDetail') {
      return EntityDetail.fromJson(json.decode(input['data'] as String) as Map<String, Object?>);
    }
    return input;
  }
}
