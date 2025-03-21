import 'package:app/src/core/utils/font_family_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'color.dart';

part 'light_theme.g.dart';

@riverpod
ThemeData lightTheme(Ref ref) {
  final fontFamily = ref.watch(fontFamilyProvider);
  final themeData = ThemeData.light(useMaterial3: true);
  return themeData.copyWith(
    colorScheme: _colorSchemeLight(themeData),
    textTheme: _textThemeLight(themeData, fontFamily),
    scaffoldBackgroundColor: kWhiteColor,
    searchBarTheme: _searchBarThemeLight(themeData),
  );
}

ColorScheme _colorSchemeLight(ThemeData lightTheme) {
  return lightTheme.colorScheme.copyWith(
    primary: kGreenColor,
    primaryContainer: kGreenColor,
    onPrimaryContainer: Colors.white,
    surface: kWhiteColor,
    // For SearchBar
    surfaceContainerLow: kLightGreyColor,
    surfaceContainerHigh: kWhiteColor,
    onSurface: kBlackColor,
    // For labels
    onSurfaceVariant: kDarkGreyColor,
  );
}

TextTheme _textThemeLight(ThemeData themeData, String fontFamily) {
  final textTheme = themeData.textTheme;
  TextStyle? bold(TextStyle? style) =>
      style?.copyWith(fontWeight: FontWeight.bold);
  TextStyle? grey(TextStyle? style) => style?.copyWith(color: kDarkGreyColor);
  return textTheme
      .copyWith(
        titleLarge: bold(textTheme.titleLarge),
        titleMedium: bold(textTheme.titleMedium),
        titleSmall: bold(textTheme.titleSmall),
        labelLarge: grey(textTheme.labelLarge),
        labelMedium: grey(textTheme.labelMedium),
        labelSmall: grey(textTheme.labelSmall),
      )
      .apply(fontFamily: fontFamily);
}

SearchBarThemeData _searchBarThemeLight(ThemeData themeData) {
  final theme = themeData.searchBarTheme;
  return theme.copyWith(elevation: WidgetStatePropertyAll(3));
}
