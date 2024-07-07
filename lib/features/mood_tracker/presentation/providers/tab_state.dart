import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EnumTabItem implements Comparable<EnumTabItem> {
  home(tabIndex: 0, icon: FontAwesomeIcons.houseChimney),
  post(tabIndex: 1, icon: FontAwesomeIcons.penToSquare),
  settings(tabIndex: 2, icon: FontAwesomeIcons.gear);

  const EnumTabItem({
    required this.tabIndex,
    required this.icon,
  });

  final int tabIndex;
  final IconData icon;

  @override
  int compareTo(EnumTabItem other) {
    return tabIndex.compareTo(other.tabIndex);
  }

  bool equals(EnumTabItem other) {
    return tabIndex == other.tabIndex;
  }
}

class TabState {
  final EnumTabItem selectedTab;

  TabState({
    required this.selectedTab,
  });

  TabState selectTab(EnumTabItem tabItem) {
    return TabState(selectedTab: tabItem);
  }
}

class TabNotifier extends StateNotifier<TabState> {
  TabNotifier() : super(TabState(selectedTab: EnumTabItem.home));

  void selectTab(EnumTabItem tabItem) {
    state = state.selectTab(tabItem);
  }
}

final tabStateProvider = StateNotifierProvider<TabNotifier, TabState>((ref) {
  return TabNotifier();
});
