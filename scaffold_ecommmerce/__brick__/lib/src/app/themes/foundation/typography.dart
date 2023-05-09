import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class AppTypography {
  const AppTypography({
    required this.brightness,
    this.primaryFont,
    this.secondaryFont,
  });

  final Brightness brightness;
  final String? primaryFont;
  final String? secondaryFont;

  ZeroTypography toTypography() {
    final typography = ZeroTypography.fromBrightness(
      brightness: brightness,
      fontFamily: primaryFont,
    );

    return typography.copyWith(
      heading1: typography.heading1?.copyWith(
        fontSize: 56,
        height: 60.0 / 56.0,
        fontFamily: primaryFont,
      ),
      heading2: typography.heading2?.copyWith(
        fontSize: 48,
        height: 52.0 / 48.0,
        fontFamily: primaryFont,
      ),
      heading3: typography.heading3?.copyWith(
        fontSize: 40,
        height: 44.0 / 40.0,
        fontFamily: primaryFont,
      ),
      heading4: typography.heading4?.copyWith(
        fontSize: 30,
        height: 34.0 / 30.0,
        fontFamily: primaryFont,
      ),
      heading5: typography.heading5?.copyWith(
        fontSize: 22,
        height: 26.0 / 22.0,
        fontFamily: primaryFont,
      ),
      heading6: typography.heading6?.copyWith(
        fontSize: 18,
        height: 22.0 / 18.0,
        fontFamily: primaryFont,
      ),
      subtitle1: typography.subtitle1?.copyWith(
        fontSize: 16,
        height: 16.0 / 16.0,
        fontFamily: primaryFont,
      ),
      subtitle2: typography.subtitle2?.copyWith(
        fontSize: 14,
        height: 14.0 / 14.0,
        fontFamily: primaryFont,
      ),
      body1: typography.body1?.copyWith(
        fontSize: 16,
        height: 20.0 / 16.0,
        fontFamily: secondaryFont,
      ),
      body2: typography.body2?.copyWith(
        fontSize: 14,
        height: 18.0 / 14.0,
        fontFamily: secondaryFont,
      ),
      caption: typography.caption?.copyWith(
        fontSize: 12,
        height: 14.0 / 12.0,
        fontFamily: secondaryFont,
      ),
      overline: typography.overline?.copyWith(
        fontSize: 12,
        height: 12.0 / 12.0,
        fontFamily: secondaryFont,
        letterSpacing: 2.5,
      ),
      button: typography.button?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 14.0 / 14.0,
        fontFamily: secondaryFont,
      ),
    );
  }
}
