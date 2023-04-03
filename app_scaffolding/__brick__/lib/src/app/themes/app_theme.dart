import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:{{ packageName }}/src/app/themes/foundation/colors.dart';
import 'package:{{ packageName }}/src/app/themes/foundation/typography.dart';

import 'package:{{ packageName }}/gen/fonts.gen.dart';

class AppTheme {
  static final ZeroThemeData light = ZeroThemeData(
      primaryColor: LightColors.primaryColor.toAccentColor(),
      brightness: Brightness.light,
      typography: const AppTypography(
              brightness: Brightness.light,
              primaryFont: FontFamily.dMMono,
              secondaryFont: FontFamily.dMMono)
          .toTypography());

  static final ZeroThemeData dark = ZeroThemeData(
      primaryColor: DarkColors.primaryColor.toAccentColor(),
      brightness: Brightness.dark,
      typography: const AppTypography(
              brightness: Brightness.dark,
              primaryFont: FontFamily.dMMono,
              secondaryFont: FontFamily.dMMono)
          .toTypography());
}
