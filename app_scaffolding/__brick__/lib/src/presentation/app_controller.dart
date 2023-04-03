import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{ packageName }}/src/presentation/app_state.dart';

class AppController extends StateNotifier<AppState> {
  AppController() : super(const AppState());

  void toggleThemeMode() {
    state = state.copyWith(
        currentTheme: state.currentTheme == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark);
  }
}

final appControllerProvider =
    StateNotifierProvider<AppController, AppState>((ref) => AppController());
