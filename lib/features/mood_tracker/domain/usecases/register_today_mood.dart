import 'package:dartz/dartz.dart';
import 'package:story_app/core/constants/mood.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/core/use_case/use_case.dart';
import 'package:story_app/features/mood_tracker/data/models/mood_entry.dart';
import 'package:story_app/features/mood_tracker/domain/repository/mood_entry_repository.dart';

class RegisterTodayMood implements UseCase<MoodEntryModel, EnumMood> {
  final MoodEntryRepository repository;

  RegisterTodayMood({required this.repository});

  @override
  Future<Either<Failure, MoodEntryModel>> execute(EnumMood mood) {
    final now = DateTime.now();
    final moodEntry = MoodEntryModel(
      id: now.toString(),
      status: mood.value,
      year: now.year,
      month: now.month,
      day: now.day,
    );
    return repository.add(moodEntry);
  }
}
