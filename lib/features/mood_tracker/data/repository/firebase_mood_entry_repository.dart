import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/features/mood_tracker/domain/entities/mood_entry.dart';
import 'package:story_app/features/mood_tracker/domain/repository/mood_entry_repository.dart';

class FirebaseMoodEntryRepository implements MoodEntryRepository {
  @override
  Future<Either<Failure, List<MoodEntryEntity>>> findMoodEntriesByMonth(
    DateTime date,
  ) async {
    try {
      return const Right([]); // TODO: Implement
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}
