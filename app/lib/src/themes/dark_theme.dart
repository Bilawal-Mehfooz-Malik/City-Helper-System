import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/src/core/utils/font_family_provider.dart';
import 'package:google_fonts/google_fonts.dart';

final darkThemeProvider = Provider<ThemeData>((ref) {
  final primaryFont = ref.watch(primaryFontFamilyProvider);
  final secondaryFont = ref.watch(secondaryFontFamilyProvider);

  final base = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(visualDensity: VisualDensity.standard);
  final baseText = base.textTheme;
  final primaryTextTheme = GoogleFonts.getTextTheme(primaryFont, baseText);
  final secondaryTextTheme = GoogleFonts.getTextTheme(secondaryFont, baseText);

  return base.copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4CD964),
      brightness: .dark,
    ),
    textTheme: primaryTextTheme.copyWith(
      bodyLarge: secondaryTextTheme.bodyLarge,
      bodyMedium: secondaryTextTheme.bodyMedium,
      bodySmall: secondaryTextTheme.bodySmall,
      labelLarge: secondaryTextTheme.labelLarge,
      labelMedium: secondaryTextTheme.labelMedium,
      labelSmall: secondaryTextTheme.labelSmall,
    ),
  );
});
