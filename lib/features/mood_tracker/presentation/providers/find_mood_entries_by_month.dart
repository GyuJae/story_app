import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_app/core/use_case/use_case.dart';
import 'package:story_app/features/mood_tracker/data/models/mood_entry.dart';
import 'package:story_app/features/mood_tracker/domain/repository/mood_entry_repository.dart';
import 'package:story_app/features/mood_tracker/domain/usecases/get_current_month_mood_entries.dart';
import 'package:story_app/injection_container.dart';

final findMoodEntiresByMonthProvider =
    Provider<UseCase<List<MoodEntryModel>, FindMoodEntiresByMonthInput>>(
  (ref) {
    return sl<GetMoodEntriesByMonth>();
  },
);
