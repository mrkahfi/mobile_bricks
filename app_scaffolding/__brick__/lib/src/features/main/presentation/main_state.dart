// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

enum MainTab {
  tab1,
  tab2,
  tab3,
  tab4,
  tab5,
  ;

  Widget get icon {
    switch (this) {
      case tab1:
        return const Icon(Icons.home);
      case tab2:
        return const Icon(Icons.list);
      case tab3:
        return const Icon(Icons.search);
      case tab4:
        return const Icon(Icons.history);
      case tab5:
        return const Icon(Icons.person);
    }
  }

  String get label {
    return name.toUpperCase();
  }
}

@freezed
class MainState with _$MainState {
  const factory MainState({@Default(MainTab.tab1) MainTab selectedTab}) =
      _MainState;
}
