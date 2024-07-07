import 'package:flutter/material.dart';

class MoodTrackerDetailPage extends StatelessWidget {
  static const String routePath = '/mood-tracker-detail/:id';
  static const String routeName = 'mood-tracker-detail-page';

  const MoodTrackerDetailPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Tracker Detail Page $id'),
      ),
    );
  }
}
