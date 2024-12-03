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
      secondary: secondaryColor,
      onSecondary: onSecondaryColor,
      error: errorColor,
      onError: onErrorColor,
      surface: surfaceColor,
      onSurface: onSurfaceColor,
    ),

    ///[AppBarThemeData]
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: onPrimaryColor,
    ),

    /// [FilledButtonThemeData]
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: shape(),
        minimumSize: buttonSize(),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 16,
            fontFamily: fontFamily,
          ),
        ),
      ),
    ),

    /// [OutlinedButtonThemeData]
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: shape(),
        minimumSize: buttonSize(),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 16,
            fontFamily: fontFamily,
          ),
        ),
      ),
    ),

    /// [OutlinedButtonThemeData]
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: shape(),
        // minimumSize: buttonSize(),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 16,
            fontFamily: fontFamily,
          ),
        ),
      ),
    ),

    /// [CardThemeData]
    cardTheme: const CardTheme(color: surfaceColor),

    /// [DialogThemeData]
    dialogTheme: DialogTheme(shape: borderRadius()),
  );
}
