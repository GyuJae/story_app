import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:story_app/core/constants/sizes.dart';
import 'package:story_app/features/mood_tracker/presentation/providers/tab_state.dart';

class MoodTrackerTabNavigator extends ConsumerWidget {
  const MoodTrackerTabNavigator({super.key});

  @override
  BottomAppBar build(BuildContext context, WidgetRef ref) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: EnumTabItem.values
            .map(
              (tabItem) => TabNavigatorItem(
                tabItem: tabItem,
              ),
            )
            .toList(),
      ),
    );
  }
}

class TabNavigatorItem extends ConsumerWidget {
  final EnumTabItem tabItem;

  const TabNavigatorItem({
    super.key,
    required this.tabItem,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(tabStateProvider).selectedTab.equals(tabItem);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref.read(tabStateProvider.notifier).selectTab(tabItem);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                tabItem.icon,
                size: Sizes.size20,
                color: isSelected
                    ? Theme.of(context).bottomAppBarTheme.color
                    : Theme.of(context).unselectedWidgetColor,
              ),
              const Gap(Sizes.size3),
            ],
          ),
        ),
      ),
    );
  }
}
