import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_app/core/constants/mood.dart';
import 'package:story_app/core/use_case/use_case.dart';
import 'package:story_app/features/mood_tracker/data/models/mood_entry.dart';
import 'package:story_app/features/mood_tracker/domain/usecases/register_today_mood.dart';
import 'package:story_app/injection_container.dart';

final registerTodayMoodProvider = Provider<UseCase<MoodEntryModel, EnumMood>>(
  (ref) {
    return sl<RegisterTodayMood>();
  },
);
