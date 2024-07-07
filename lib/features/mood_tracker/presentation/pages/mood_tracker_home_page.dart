import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:story_app/core/constants/sizes.dart';
import 'package:story_app/features/mood_tracker/presentation/widgets/mood_tracker_tab_navigator.dart';

class MoodTrackerHomePage extends StatelessWidget {
  static const String routePath = '/mood-tracker';
  static const String routeName = 'mood-tracker-home-page';

  const MoodTrackerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Gap(Sizes.size20),
        ],
      ),
      bottomNavigationBar: MoodTrackerTabNavigator(),
    );
  }
}
