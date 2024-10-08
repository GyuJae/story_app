import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/core/use_case/use_case.dart';
import 'package:story_app/features/mood_tracker/data/models/mood_entry.dart';
import 'package:story_app/features/mood_tracker/domain/repository/mood_entry_repository.dart';

class GetMoodEntriesByMonth
    extends UseCase<List<MoodEntryModel>, FindMoodEntiresByMonthInput> {
  final MoodEntryRepository moodEntryRepository;

  GetMoodEntriesByMonth({required this.moodEntryRepository});

  @override
  Future<Either<Failure, List<MoodEntryModel>>> execute(params) async {
    return await moodEntryRepository.findMoodEntriesByMonth(params);
  }
}
