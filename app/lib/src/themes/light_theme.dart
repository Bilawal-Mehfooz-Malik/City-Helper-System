import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'color.dart';
import 'theme_helpers.dart';
import '../core/utils/font_family_provider.dart';

part 'light_theme.g.dart';

@riverpod
ThemeData lightTheme(Ref ref) {
  final fontFamily = ref.watch(fontFamilyProvider);

  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: onPrimaryColor,
      inversePrimary: inversePrimaryColor,
      secondary: secondaryColor,
      onSecondary: onSecondaryColor,
      error: errorColor,
      onError: onErrorColor,
      surface: surfaceColor,
      onSurface: onSurfaceColor,
    ),

    /// [SearchBarThemeData]
    searchBarTheme: SearchBarThemeData(
      elevation: const WidgetStatePropertyAll(2),
      hintStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 16,
          fontFamily: fontFamily,
          color: inversePrimaryColor,
        ),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 16, fontFamily: fontFamily),
      ),
      overlayColor: const WidgetStatePropertyAll(onPrimaryColor),
    ),

    /// [FilledButtonThemeData]
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: shape(),
        minimumSize: buttonSize(),
        textStyle: buttonTextStyle(fontFamily),
      ),
    ),

    /// [OutlinedButtonThemeData]
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: shape(),
        minimumSize: buttonSize(),
        textStyle: buttonTextStyle(fontFamily),
      ),
    ),

    /// [OutlinedButtonThemeData]
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: shape(),
        textStyle: buttonTextStyle(fontFamily),
      ),
    ),

    /// [CardThemeData]
    cardTheme: const CardTheme(color: surfaceColor),

    /// [DialogThemeData]
    dialogTheme: DialogTheme(shape: borderRadius()),

    /// [TextThemeData]
    textTheme: TextTheme(
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        color: inversePrimaryColor,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        color: inversePrimaryColor,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        color: inversePrimaryColor,
      ),
    ),
  );
}
