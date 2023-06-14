import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({@Default(ThemeMode.light) ThemeMode currentTheme}) =
      _AppState;
}
