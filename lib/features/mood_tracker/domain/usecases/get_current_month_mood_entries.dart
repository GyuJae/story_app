import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/core/use_case/use_case.dart';
import 'package:story_app/features/mood_tracker/domain/entities/mood_entry.dart';
import 'package:story_app/features/mood_tracker/domain/repository/mood_entry_repository.dart';

class GetCurrentMonthMoodEntries
    extends UseCase<List<MoodEntryEntity>, DateTime> {
  final MoodEntryRepository moodEntryRepository;

  GetCurrentMonthMoodEntries({required this.moodEntryRepository});

  @override
  Future<Either<Failure, List<MoodEntryEntity>>> execute(params) async {
    return await moodEntryRepository.findMoodEntriesByMonth(params);
  }
}
