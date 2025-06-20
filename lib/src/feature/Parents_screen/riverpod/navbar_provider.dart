import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morsl_app_celina0057/src/feature/Parents_screen/state_model/state.dart';
import 'package:morsl_app_celina0057/src/feature/Reset_screen/view/reset_screen.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/view/favorite_screen.dart';
import 'package:morsl_app_celina0057/src/feature/home_screen/home_screen.dart';
import 'package:morsl_app_celina0057/src/feature/settings_screen/view/settings_screen.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

final parentsScreenProvider =
    StateNotifierProvider<ParentsScreenNotifier, ParentScreenRiverPodModel>((ref) {
  return ParentsScreenNotifier();
});


class ParentsScreenNotifier extends StateNotifier<ParentScreenRiverPodModel> {
  ParentsScreenNotifier() : super(const ParentScreenRiverPodModel());

  final List<Widget> _pageList = [
    HomeScreen(),
    FavoriteScreen(),
    ResetScreen(),
    SettingsScreen(),
  ];

  List<Widget> get pageList => _pageList;

  void onSelectedIndex(int index) {
    debugPrint("Selected Page index : $index");
    state = state.copyWith(selectedIndex: index);
  }
}

