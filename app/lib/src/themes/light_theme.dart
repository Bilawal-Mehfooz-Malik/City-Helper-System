import 'package:app/src/core/utils/font_family_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'color.dart';

part 'light_theme.g.dart';

class AppColors {
  AppColors._();
  static const greenColor = Color.fromRGBO(76, 217, 100, 1);
  static const darkGreyColor = Color.fromARGB(255, 82, 82, 82);
}

@riverpod
ThemeData lightTheme(Ref ref) {
  final fontFamily = ref.watch(fontFamilyProvider);
  final themeData = ThemeData.light(useMaterial3: true);
  return themeData.copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.greenColor).copyWith(tertiary: amberColor),
    textTheme: _textThemeLight(themeData, fontFamily),
  );
}

TextTheme _textThemeLight(ThemeData themeData, String fontFamily) {
  final textTheme = themeData.textTheme;
  TextStyle? grey(TextStyle? style) =>
      style?.copyWith(color: AppColors.darkGreyColor);

  return textTheme
      .copyWith(
        labelLarge: grey(textTheme.labelLarge),
        labelMedium: grey(textTheme.labelMedium),
        labelSmall: grey(textTheme.labelSmall),
      )
      .apply(fontFamily: fontFamily);
}

// TODO: Remove themeData if not needed
// return themeData.copyWith(
  //   colorScheme: _colorSchemeLight(themeData),
  //   textTheme: _textThemeLight(themeData, fontFamily),
  //   scaffoldBackgroundColor: kWhiteColor,
  //   searchBarTheme: _searchBarThemeLight(themeData),
  //   chipTheme: themeData.chipTheme.copyWith(
  //     backgroundColor: kLightGreyColor,
  //     selectedColor: kGreenColor,
  //     secondarySelectedColor: kGreenColor,
  //     labelStyle: themeData.textTheme.labelSmall,
  //     secondaryLabelStyle: themeData.textTheme.labelSmall,
  //     side: BorderSide(color: kBlackColor),
  //   ),
  // );
// ColorScheme _colorSchemeLight(ThemeData lightTheme) {
//   return lightTheme.colorScheme.copyWith(
//     primary: kGreenColor,
//     primaryContainer: kGreenColor,
//     onPrimaryContainer: Colors.white,
//     surface: kWhiteColor,
//     // For SearchBar
//     surfaceContainerLow: kLightGreyColor,
//     surfaceContainerHigh: kWhiteColor,
//     onSurface: kBlackColor,
//     // For labels
//     onSurfaceVariant: kDarkGreyColor,
//   );
// }
// SearchBarThemeData _searchBarThemeLight(ThemeData themeData) {
//   final theme = themeData.searchBarTheme;
//   return theme.copyWith(elevation: WidgetStatePropertyAll(3));
// }
