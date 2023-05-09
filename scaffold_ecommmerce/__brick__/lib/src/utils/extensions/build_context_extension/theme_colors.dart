import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

extension BuildContextEntension<T> on BuildContext {
  // colors
  Color get primaryColor => ZeroTheme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primary => ZeroTheme.of(this).colorScheme.primary;

  Color get onPrimary => ZeroTheme.of(this).colorScheme.onPrimary;

  Color get secondary => ZeroTheme.of(this).colorScheme.secondary;

  Color get onSecondary => ZeroTheme.of(this).colorScheme.onSecondary;

  Color get cardColor => ZeroTheme.of(this).cardColor;

  Color get errorColor => ZeroTheme.of(this).colorScheme.error;

  Color get background => ZeroTheme.of(this).colorScheme.background;
}
