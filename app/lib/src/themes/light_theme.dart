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

    /// [FilledButtonThemeData]
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: shape(),
        minimumSize: buttonSize(),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 16,
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),

    /// [CardThemeData]
    cardTheme: const CardTheme(color: surfaceColor),
  );
}
