import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '/src/core/utils/font_family_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'light_theme.g.dart';

@riverpod
ThemeData lightTheme(Ref ref) {
  final primaryFont = ref.watch(primaryFontFamilyProvider);
  final secondaryFont = ref.watch(secondaryFontFamilyProvider);
  final tertiaryFont = ref.watch(tertiaryFontFamilyProvider);

  final base = ThemeData.light(useMaterial3: true);
  final baseText = base.textTheme;

  return base.copyWith(
    textTheme: baseText.copyWith(
      // Headings (Primary)
      displayLarge: _applyFont(primaryFont, baseText.headlineLarge),
      displayMedium: _applyFont(primaryFont, baseText.headlineMedium),
      displaySmall: _applyFont(primaryFont, baseText.headlineSmall),
      headlineLarge: _applyFont(primaryFont, baseText.headlineLarge),
      headlineMedium: _applyFont(primaryFont, baseText.headlineMedium),
      headlineSmall: _applyFont(primaryFont, baseText.headlineSmall),
      titleLarge: _applyFont(primaryFont, baseText.titleLarge),
      titleMedium: _applyFont(primaryFont, baseText.titleMedium),
      titleSmall: _applyFont(primaryFont, baseText.titleSmall),

      // Body (Secondary)
      bodyLarge: _applyFont(secondaryFont, baseText.bodyLarge),
      bodyMedium: _applyFont(secondaryFont, baseText.bodyMedium),
      bodySmall: _applyFont(secondaryFont, baseText.bodySmall),

      // Labels (Tertiary)
      labelLarge: _applyFont(tertiaryFont, baseText.labelLarge),
      labelMedium: _applyFont(tertiaryFont, baseText.labelMedium),
      labelSmall: _applyFont(tertiaryFont, baseText.labelSmall),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromRGBO(76, 217, 100, 1),
    ),
  );
}

TextStyle _applyFont(String fontName, TextStyle? style) {
  return GoogleFonts.getFont(fontName, textStyle: style);
}
