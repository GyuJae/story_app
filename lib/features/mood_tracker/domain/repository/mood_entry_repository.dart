import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/features/mood_tracker/data/models/mood_entry.dart';
import 'package:story_app/features/mood_tracker/domain/entities/mood_entry.dart';

abstract class MoodEntryRepository {
  Future<Either<Failure, List<MoodEntryEntity>>> findMoodEntriesByMonth(
    DateTime date,
  );

  Future<Either<Failure, MoodEntryModel>> add(MoodEntryModel moodEntryModel);
}
