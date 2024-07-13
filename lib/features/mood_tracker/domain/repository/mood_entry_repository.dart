import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/features/mood_tracker/data/models/mood_entry.dart';

class FindMoodEntiresByMonthInput {
  final int year;
  final int month;

  FindMoodEntiresByMonthInput({
    required this.year,
    required this.month,
  });

  factory FindMoodEntiresByMonthInput.dateTimeOf(DateTime date) {
    return FindMoodEntiresByMonthInput(
      year: date.year,
      month: date.month,
    );
  }
}

abstract class MoodEntryRepository {
  Future<Either<Failure, List<MoodEntryModel>>> findMoodEntriesByMonth(
    FindMoodEntiresByMonthInput input,
  );

  Future<Either<Failure, MoodEntryModel>> add(MoodEntryModel moodEntryModel);
}
