import 'package:flutter/material.dart';
import 'package:story_app/core/constants/sizes.dart';

class MoodTrackerCalendarItem extends StatelessWidget {
  const MoodTrackerCalendarItem({
    super.key,
    required this.day,
  });

  final int day;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$day',
        style: TextStyle(
          fontSize: Sizes.size14,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
