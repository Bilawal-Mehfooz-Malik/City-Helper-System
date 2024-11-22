import 'package:app/src/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

final _shape = WidgetStatePropertyAll(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.p8)));

WidgetStatePropertyAll<Size?> _buttonSize() =>
    const WidgetStatePropertyAll(Size(double.infinity, Sizes.p48));

final lightTheme = ThemeData(
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
  textTheme: GoogleFonts.poppinsTextTheme(),

  /// [FilledButtonThemeData]
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(shape: _shape, minimumSize: _buttonSize()),
  ),

  /// [CardThemeData]
  cardTheme: const CardTheme(color: surfaceColor),
);
