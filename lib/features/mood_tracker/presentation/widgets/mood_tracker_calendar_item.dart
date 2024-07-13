import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/core/constants/sizes.dart';
import 'package:story_app/features/mood_tracker/data/models/mood_entry.dart';
import 'package:story_app/features/mood_tracker/presentation/pages/mood_tracker_detail_page.dart';

class MoodTrackerCalendarItem extends StatelessWidget {
  const MoodTrackerCalendarItem({
    super.key,
    required this.day,
    required this.moodEntryModel,
  });

  final int day;
  final MoodEntryModel? moodEntryModel;

  @override
  Widget build(BuildContext context) {
    final bool existsMoodEntry = moodEntryModel != null;

    return GestureDetector(
      onTap: () {
        if (existsMoodEntry) return;
        context.pushNamed(MoodTrackerDetailPage.routeName,
            pathParameters: <String, String>{'id': moodEntryModel!.id});
      },
      child: Container(
        decoration: BoxDecoration(
          color: moodEntryModel != null
              ? moodEntryModel!.getStatusColor()
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '$day',
            style: TextStyle(
              fontSize: Sizes.size16,
              color: existsMoodEntry ? Colors.black : null,
            ),
          ),
        ),
      ),
    );
  }
}
