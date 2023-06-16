import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

extension BuildContextEntension<T> on BuildContext {
  // text styles

  TextStyle? get displayMedium =>
      ZeroTheme.of(this).typography.toTextTheme().displayMedium;

  TextStyle? get displaySmall =>
      ZeroTheme.of(this).typography.toTextTheme().displaySmall;

  TextStyle? get headlineLarge =>
      ZeroTheme.of(this).typography.toTextTheme().headlineLarge;

  TextStyle? get headlineMedium =>
      ZeroTheme.of(this).typography.toTextTheme().headlineMedium;

  TextStyle? get titleLarge =>
      ZeroTheme.of(this).typography.toTextTheme().titleLarge;

  TextStyle? get titleMedium =>
      ZeroTheme.of(this).typography.toTextTheme().titleMedium;

  TextStyle? get titleSmall =>
      ZeroTheme.of(this).typography.toTextTheme().titleSmall;

  TextStyle? get labelLarge =>
      ZeroTheme.of(this).typography.toTextTheme().labelLarge;

  TextStyle? get bodySmall =>
      ZeroTheme.of(this).typography.toTextTheme().bodySmall;

  TextStyle? get titleTextStyle => ZeroTheme.of(this).appBarStyle.titleStyle;

  TextStyle? get bodyExtraSmall =>
      bodySmall?.copyWith(fontSize: 10, height: 1.6, letterSpacing: .5);

  TextStyle? get bodyLarge =>
      ZeroTheme.of(this).typography.toTextTheme().bodyLarge;

  TextStyle? get dividerTextSmall => bodySmall?.copyWith(
        letterSpacing: 0.5,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      );

  TextStyle? get dividerTextLarge => bodySmall?.copyWith(
        letterSpacing: 1.5,
        fontWeight: FontWeight.w700,
        fontSize: 13,
        height: 1.23,
      );
}
