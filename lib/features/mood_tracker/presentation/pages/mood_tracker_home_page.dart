import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_app/features/mood_tracker/presentation/pages/mood_entity_register_page.dart';
import 'package:story_app/features/mood_tracker/presentation/providers/tab_state.dart';
import 'package:story_app/features/mood_tracker/presentation/widgets/mood_tracker_calendar.dart';
import 'package:story_app/features/mood_tracker/presentation/widgets/mood_tracker_tab_navigator.dart';

class MoodTrackerHomePage extends ConsumerWidget {
  static const String routePath = '/mood-tracker';
  static const String routeName = 'mood-tracker-home-page';

  const MoodTrackerHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(tabStateProvider).selectedTab;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Offstage(
              offstage: !selectedTab.equals(EnumTabItem.home),
              child: const MoodTrackerCalendar(),
            ),
            Offstage(
              offstage: !selectedTab.equals(EnumTabItem.post),
              child: const MoodEntityRegisterPage(),
            )
          ],
        ),
      ),
      bottomNavigationBar: const MoodTrackerTabNavigator(),
    );
  }
}
