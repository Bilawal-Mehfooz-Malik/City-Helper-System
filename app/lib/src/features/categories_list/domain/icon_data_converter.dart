import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class IconDataConverter
    implements JsonConverter<IconData, Map<String, Object?>> {
  const IconDataConverter();

  @override
  IconData fromJson(Map<String, Object?> json) {
    return IconData(
      json['codePoint'] as int,
      fontFamily: json['fontFamily'] as String?,
      fontPackage: json['fontPackage'] as String?,
      matchTextDirection: json['matchTextDirection'] as bool? ?? false,
      fontFamilyFallback:
          (json['fontFamilyFallback'] as List<Object?>?)
              ?.whereType<String>()
              .toList(),
    );
  }

  @override
  Map<String, Object?> toJson(IconData iconData) {
    return {
      'codePoint': iconData.codePoint,
      'fontFamily': iconData.fontFamily,
      'fontPackage': iconData.fontPackage,
      'matchTextDirection': iconData.matchTextDirection,
      'fontFamilyFallback': iconData.fontFamilyFallback,
    };
  }
}
